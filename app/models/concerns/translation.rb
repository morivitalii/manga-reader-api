# This module is intended to simplify model attributes translations
#
# Example of migration for model translations table:
#
# create_table :resource_translations do |t|
#   # Reference to content languages table
#   t.belongs_to :content_language, foreign_key: true
#
#   # Reference to translatable model
#   t.belongs_to :resource, null: false, foreign_key: { to_table: :model_table }
#
#   # Translatable model attributes
#   # Each column must be not null and has empty string as default value
#   t.string :resource_attribute_for_translation, null: false, default: ""
#   t.text :other_resource_attribute_for_translation, null: false, default: ""
#
#   # Store information about last edit time for translatable attributes
#   # Must be not null and has precision of 6
#   t.datetime :edited_at, null: false, precision: 6
#
#   t.timestamps
#
#   # By creating this index we ensure that resource will have only one translation record for each content language
#   t.index [:resource_id, :content_language_id], unique: true, name: "index_resource_translations_uniqueness"
# end
module Translation
  extend ActiveSupport::Concern

  included do
    has_many :translations, autosave: true, class_name: "#{name}Translation", foreign_key: :resource_id, dependent: :destroy
    has_many :content_languages, through: :translations

    # List of translations associations
    def self.translations_associations
      {translations: {content_language: :locale}}
    end

    # Convenient method to include all associations related to translations
    def self.with_translations
      includes(translations_associations)
    end
  end

  class_methods do
    def translates(*attributes)
      # Translation model
      translation_class_name = "#{name}Translation"

      unless Object.const_defined?(translation_class_name)
        resource_class_name = name

        translation_class = Class.new(ApplicationRecord) {
          # This attributes shouldn't be changed
          attr_readonly :content_language_id, :resource_id

          # Attribute store information about last translation edit time
          attribute :edited_at, :datetime

          belongs_to :content_language
          belongs_to :resource, class_name: resource_class_name

          # Ensure that resource can have only one translation with given content language
          # Validation not needed if translatable model is new
          validates :resource_id, uniqueness: {scope: [:content_language_id]}, if: -> { resource_id.present? }

          # Update edited_at if any attribute from translation attributes changed
          before_save :touch_edited_at

          define_method(:translation_attributes) do
            self.attributes.deep_symbolize_keys.slice(*translation_attributes_names).merge(metadata_attributes)
          end

          define_method(:metadata_attributes) do
            {
              content_language_id: content_language.id,
              locale: content_language.locale.key,
              created_at: created_at,
              updated_at: updated_at,
              edited_at: edited_at
            }
          end

          # Attributes that available for translation
          define_method(:translation_attributes_names) do
            @translation_attributes_names ||= attribute_names.map(&:to_sym) - metadata_attributes_names - service_attributes_names
          end

          # Attributes that contains metadata information about translation
          define_method(:metadata_attributes_names) do
            [:content_language_id, :locale, :edited_at, :created_at, :updated_at]
          end

          # Attributes that contains service information about translation model
          define_method(:service_attributes_names) do
            [:id, :resource_id]
          end

          private

          define_method(:touch_edited_at) do
            return unless translation_attributes_changed?

            self.edited_at = Time.current
          end

          define_method(:translation_attributes_changed?) do
            changes.any? { |attribute, (_was, _become)| attribute.to_sym.in?(translation_attributes_names) }
          end
        }

        Object.const_set(translation_class_name, translation_class)
      end

      # Method returns list of attributes available for translation
      define_method(:translation_attributes_names) do
        attributes
      end

      # Reader methods for attributes that available for translation
      attributes.each do |attribute|
        method_name = attribute

        define_method(method_name) do
          translation = find_or_build_translation(I18n.locale.to_s)

          translation.read_attribute(attribute)
        end
      end

      # Writer methods for attributes that available for translation
      attributes.each do |attribute|
        method_name = "#{attribute}="

        define_method(method_name) do |value|
          translation = find_or_build_translation(I18n.locale.to_s)

          translation.write_attribute(attribute, value)
        end
      end
    end
  end

  def translation_attributes
    @translation_attributes ||= translation_available_content_languages.each_with_object([]) { |content_language, translation_attributes|
      i18n_locale = content_language.locale.key

      # It's necessary to get translation for each content language, even for those which translation is missing in database
      translation = find_or_build_translation(i18n_locale)

      # Get translation attributes and their values from translation model
      translation_attributes << translation.translation_attributes
    }
  end

  # Content languages that available for translation
  def translation_available_content_languages
    @translation_available_content_languages ||= Current.content_languages
  end

  # Content languages that available for translation and completely translated
  def translation_completed_content_languages
    @translation_completed_content_languages ||= translation_available_content_languages.select { |content_language|
      i18n_locale = content_language.locale.key

      # Find translation attributes for current i18n locale
      i18n_locale_translation_attributes = find_translation_attributes(i18n_locale)

      # Remove metadata attributes for following lookup of present attributes values
      i18n_locale_translation_attributes_without_metadata = i18n_locale_translation_attributes.slice(*translation_attributes_names)

      # If locale has all attributes values preset then it's translation completed
      i18n_locale_translation_attributes_without_metadata.none? { |_attribute, value| value.blank? }
    }
  end

  # Content languages that available for translation but not completed yet
  def translation_content_languages_in_progress
    @translation_content_languages_in_progress ||= translation_available_content_languages.select { |content_language|
      i18n_locale = content_language.locale.key

      # Find translation attributes for current i18n locale
      i18n_locale_translation_attributes = find_translation_attributes(i18n_locale)

      # Remove metadata attributes for following lookup of blank and present attributes values
      i18n_locale_translation_attributes_without_metadata = i18n_locale_translation_attributes.slice(*translation_attributes_names)

      # Search for present attributes values
      present_values = i18n_locale_translation_attributes_without_metadata.any? { |_attribute, value| value.present? }

      # Search for blank attributes values
      blank_values = i18n_locale_translation_attributes_without_metadata.any? { |_attribute, value| value.blank? }

      # If locale has both blank and present attributes values then it's translation in process
      present_values.present? && blank_values.present?
    }
  end

  # Content languages that available for translation but not translated entirely
  def translation_absent_content_languages
    @translation_absent_content_languages ||= translation_available_content_languages.select { |content_language|
      i18n_locale = content_language.locale.key

      # Find translation attributes for current i18n locale
      i18n_locale_translation_attributes = find_translation_attributes(i18n_locale)

      # Remove metadata attributes for following lookup of blank attributes values
      i18n_locale_translation_attributes_without_metadata = i18n_locale_translation_attributes.slice(*translation_attributes_names)

      # If locale has all attributes values blank then translations for it is absent
      i18n_locale_translation_attributes_without_metadata.all? { |_attribute, value| value.blank? }
    }
  end

  private

  def find_or_build_translation(i18n_locale)
    find_translation(i18n_locale) || build_translation(i18n_locale)
  end

  def find_translation(i18n_locale)
    translation = translations.find { |translation| translation.content_language&.locale&.key == i18n_locale }

    if translation.present?
      translation.resource = self
      translation.content_language = find_content_language(i18n_locale)
    end

    translation
  end

  def build_translation(i18n_locale)
    translations.build(resource: self, content_language: find_content_language(i18n_locale))
  end

  def find_content_language(i18n_locale)
    Current.content_languages&.find { |content_language| content_language.locale.key == i18n_locale }
  end

  def find_translation_attributes(i18n_locale)
    translation_attributes.find { |translation_attributes| translation_attributes[:locale] == i18n_locale }
  end
end

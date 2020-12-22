# This module is intended to simplify model attributes translations
#
# Each translated model has translations for many locales
# Translated attributes proxied from dynamically defined translation model to translated model
# Translations are destroyed along with the translated model
module Translations
  extend ActiveSupport::Concern

  included do
    has_many :translations,
      autosave: true,
      class_name: "#{self.name}Translation",
      foreign_key: :resource_id,
      dependent: :destroy

    has_many :locales, through: :translations
  end

  class_methods do
    def translates(*attributes)
      # Define translation model
      translation_class_name = "#{self.name}Translation"
      unless Object.const_defined?(translation_class_name)
        resource_class_name = self.name

        translation_class = Class.new(ApplicationRecord) do
          belongs_to :locale
          belongs_to :resource, class_name: resource_class_name

          validates :resource_id, uniqueness: { scope: [:locale_id] }
        end

        Object.const_set(translation_class_name, translation_class)
      end

      # Define reader methods
      attributes.each do |attribute|
        method_name = attribute

        define_method(method_name) do
          translation = find_or_build_translation

          translation.read_attribute(attribute)
        end
      end

      # Define writer methods
      attributes.each do |attribute|
        method_name = "#{attribute}="

        define_method(method_name) do |value|
          translation = find_or_build_translation

          translation.write_attribute(attribute, value)
        end
      end
    end
  end

  def find_or_build_translation
    translation = self.translations.detect { |translation| translation.locale.key == I18n.locale.to_s }

    if translation.blank?
      locale = Locale.where(key: I18n.locale).take!

      translation = self.translations.build(resource: self, locale: locale)
    end

    translation
  end
end
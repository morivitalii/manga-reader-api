module Internationalization
	extend ActiveSupport::Concern

	included do
		around_action :set_i18n_locale
		before_action :set_current_content_languages
		before_action :set_current_content_language
		before_action :set_current_interface_languages
		before_action :set_current_interface_language
	end

	private

	def set_i18n_locale(&action)
		# Right now russian is only one of available locales for consumers
		I18n.with_locale(:ru, &action)
	end

	def set_current_content_languages
		content_languages = ContentLanguage.order(id: :asc).all

		ActiveRecord::Associations::Preloader.new.preload(
			content_languages, [
				ContentLanguage.translations_associations,
				:locale
			]
		)

		Current.content_languages = content_languages
	end

	def set_current_content_language
		Current.content_language = Current.content_languages.detect do |content_language|
			content_language.locale.key == I18n.locale.to_s
		end
	end

	def set_current_interface_languages
		interface_languages = InterfaceLanguage.order(id: :asc).all

		ActiveRecord::Associations::Preloader.new.preload(
			interface_languages, [
				InterfaceLanguage.translations_associations,
				:locale
			]
		)

		Current.interface_languages = interface_languages
	end

	def set_current_interface_language
		Current.interface_language = Current.interface_languages.detect do |interface_language|
			interface_language.locale.key == I18n.locale.to_s
		end
	end
end

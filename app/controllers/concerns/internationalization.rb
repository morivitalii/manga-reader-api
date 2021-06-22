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
		query = ContentLanguage.order(id: :asc)
		cache_key = variable_cache_key(query)

		# Any change in this code block must be accompanied by thinking
		# about the cache invalidation with model associations
		content_languages = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
			content_languages = query.all

			ActiveRecord::Associations::Preloader.new.preload(
				content_languages, [
					ContentLanguage.translations_associations,
					:locale
				]
			)

			content_languages
		end

		Current.content_languages = content_languages
	end

	def set_current_content_language
		Current.content_language = Current.content_languages.detect do |content_language|
			content_language.locale.key == I18n.locale.to_s
		end
	end

	def set_current_interface_languages
		query = InterfaceLanguage.order(id: :asc)
		cache_key = variable_cache_key(query)

		# Any change in this code block must be accompanied by thinking
		# about the cache invalidation with model associations
		interface_languages = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
			interface_languages = query.all

			ActiveRecord::Associations::Preloader.new.preload(
				interface_languages, [
					InterfaceLanguage.translations_associations,
					:locale
				]
			)

			interface_languages
		end

		Current.interface_languages = interface_languages
	end

	def set_current_interface_language
		Current.interface_language = Current.interface_languages.detect do |interface_language|
			interface_language.locale.key == I18n.locale.to_s
		end
	end
end

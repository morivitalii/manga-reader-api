module SetCurrentInterfaceLanguages
  extend ActiveSupport::Concern

  included do
    before_action :set_current_interface_languages
  end

  private

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
end

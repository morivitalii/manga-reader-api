module SetCurrentContentLanguages
  extend ActiveSupport::Concern

  included do
    before_action :set_current_content_languages
  end

  private

  def set_current_content_languages
    query = ContentLanguage.order(id: :asc)
    cache_key = variable_cache_key(query)

    content_languages = Rails.cache.fetch(cache_key) do
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
end

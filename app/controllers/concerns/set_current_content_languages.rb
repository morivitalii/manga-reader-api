module SetCurrentContentLanguages
  extend ActiveSupport::Concern

  included do
    before_action :set_current_content_languages
  end

  private

  def set_current_content_languages
    Current.content_languages = ContentLanguage.strict_loading.includes(
      :locale,
      translations: [content_language: :locale]
    ).all
  end
end

module SetCurrentContentLanguage
  extend ActiveSupport::Concern

  included do
    before_action :set_current_content_language
  end

  private

  def set_current_content_language
    Current.content_language = Current.content_languages.detect do |content_language|
      content_language.locale.key == I18n.locale.to_s
    end
  end
end

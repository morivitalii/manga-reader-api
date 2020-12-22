module SetCurrentLocale
  extend ActiveSupport::Concern

  included do
    before_action :set_current_locale
  end

  private

  def set_current_locale
    Current.locale = Locale.where(key: I18n.locale).take!
  end
end

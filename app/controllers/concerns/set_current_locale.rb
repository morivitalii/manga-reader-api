module SetCurrentLocale
  extend ActiveSupport::Concern

  included do
    before_action :set_current_locale
  end

  private

  def set_current_locale
    Current.locale = Current.locales.detect { |locale| locale.key == I18n.locale.to_s }
  end
end

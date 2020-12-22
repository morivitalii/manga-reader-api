module SetCurrentLocalesLocale
  extend ActiveSupport::Concern

  included do
    before_action :set_current_locales
  end

  private

  def set_current_locales
    Current.locales = Locale.all
  end
end

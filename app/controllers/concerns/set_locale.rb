module SetLocale
  extend ActiveSupport::Concern

  included do
    around_action :set_locale
  end

  private

  def set_locale(&action)
    # Right now english is only one of available locales to consumers
    I18n.with_locale(:en, &action)
  end
end

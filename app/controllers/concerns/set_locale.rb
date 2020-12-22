module SetLocale
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end

  private

  def set_locale
    # TODO right now it's only one available locale
    I18n.locale = :en
  end
end

module SetCurrentInterfaceLanguage
  extend ActiveSupport::Concern

  included do
    before_action :set_current_interface_language
  end

  private

  def set_current_interface_language
    Current.interface_language = InterfaceLanguage.joins(:locale).where(locales: {key: I18n.locale}).take
  end
end

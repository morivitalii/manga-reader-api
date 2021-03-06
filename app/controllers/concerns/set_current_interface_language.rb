module SetCurrentInterfaceLanguage
  extend ActiveSupport::Concern

  included do
    before_action :set_current_interface_language
  end

  private

  def set_current_interface_language
    Current.interface_language = Current.interface_languages.detect do |interface_language|
      interface_language.locale.key == I18n.locale.to_s
    end
  end
end

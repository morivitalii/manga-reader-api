class Api::ApplicationController < ActionController::API
  include ActiveStorage::SetCurrent
  include SetLocale
  include SetCurrentContentLanguages
  include SetCurrentContentLanguage
  include SetCurrentInterfaceLanguage

  include Authentication

  include Pundit
  include Authorization
end

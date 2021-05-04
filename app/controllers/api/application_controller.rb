class Api::ApplicationController < ActionController::API
  include ActiveStorage::SetCurrent
  include SetLocale
  include Caching
  include SetCurrentContentLanguages
  include SetCurrentContentLanguage
  include SetCurrentInterfaceLanguages
  include SetCurrentInterfaceLanguage
  include Authentication
  include Pundit
  include Authorization
  include Filtering
end

class ApplicationController < ActionController::API
  include SetLocale
  include SetCurrentContentLanguages
  include SetCurrentContentLanguage
end

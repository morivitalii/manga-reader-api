class Api::ApplicationController < ActionController::API
  include ActiveStorage::SetCurrent
  include Pundit
  include Caching
  include Filtering
  include Internationalization
  include Authentication
  include Authorization
end

class Api::ApplicationController < ActionController::API
  include ActiveStorage::SetCurrent
  include Pundit
  include Api::Filtering
  include Api::Internationalization
  include Api::Authentication
  include Api::Authorization
  include Api::Pagination
end

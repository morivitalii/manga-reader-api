class Api::ApplicationController < ActionController::API
  include ActiveStorage::SetCurrent
  include Pundit
  include Api::Filtering
  include Internationalization
  include Authentication
  include Authorization
  include Pagination
end

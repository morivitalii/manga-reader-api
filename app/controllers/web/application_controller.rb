class Web::ApplicationController < ActionController::Base
	protect_from_forgery with: :exception, prepend: true

	include ActiveStorage::SetCurrent
	include Pundit
	include Internationalization
	include Authentication
	include Authorization
	include Pagination

	layout "application"
end
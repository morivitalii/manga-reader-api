class DocumentationController < ActionController::Base
	def index
		respond_to :html, :yaml
	end
end
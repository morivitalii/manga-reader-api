Rails.application.routes.draw do
	resources :documentation, controller: :documentation, only: [:index]
end

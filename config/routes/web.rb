Rails.application.routes.draw do
	root "web/home#index"

	scope module: :web do
		resource :sign_up, controller: :sign_up, only: [:new, :create]
		resource :sign_in, controller: :sign_in, only: [:new, :create]
	end
end

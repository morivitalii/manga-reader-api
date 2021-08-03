Rails.application.routes.draw do
	root "web/home#index"

	scope module: :web do

	end
end

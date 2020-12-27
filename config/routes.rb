Rails.application.routes.draw do
  constraints -> (request) { request.format == :json } do
    resources :demographics, only: [:index, :show]
  end

  namespace :api, constraints: -> (request) { request.format == :json } do
    resources :interface_languages, only: [:index, :show]
    resources :content_languages, only: [:index, :show]
    resources :genres, only: [:index, :show]
    resources :formats, only: [:index, :show]
  end
end

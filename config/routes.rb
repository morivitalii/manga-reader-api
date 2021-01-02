Rails.application.routes.draw do
  resources :documentations, only: [:index]

  namespace :api, constraints: ->(request) { request.format == :json } do
    resources :interface_languages, only: [:index, :show]
    resources :content_languages, only: [:index, :show]

    resources :tags, only: [:index, :show] do
      scope module: :tags do
        resource :translations, only: [:show]
      end
    end

    resources :marks, only: [:index, :show]
    resources :genres, only: [:index, :show]
    resources :themes, only: [:index, :show]
    resources :formats, only: [:index, :show]
    resources :demographics, only: [:index, :show]
    resources :titles, only: [:index, :show]
  end
end

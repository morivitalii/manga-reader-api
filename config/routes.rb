Rails.application.routes.draw do
  resources :documentations, only: [:index]

  namespace :api, constraints: ->(request) { request.format == :json } do
    resource :sign_up, only: [:create], controller: :sign_up
    resource :sign_in, only: [:create], controller: :sign_in
    resource :sign_out, only: [:destroy], controller: :sign_out

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
    resources :users, only: [:index, :show]
    resources :artists, only: [:index, :show]
    resources :painters, only: [:index, :show]
    resources :translators, only: [:index, :show]
    resources :groups, only: [:index, :show]
  end
end

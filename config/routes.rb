Rails.application.routes.draw do
  root "frontend/home#index"

  resources :documentations, only: [:index]

  scope module: :frontend do

  end

  namespace :api, constraints: ->(request) { request.format == :json } do
    resource :sign_up, only: [:create], controller: :sign_up
    resource :sign_in, only: [:create], controller: :sign_in
    resource :sign_out, only: [:destroy], controller: :sign_out

    namespace :users do
      resource :settings, only: [:show, :update]

      namespace :bookmarks do
        resources :titles, only: [:index]
        resources :chapters, only: [:index]
        resources :pages, only: [:index]
      end

      namespace :favorites do
        resources :titles, only: [:index]
        resources :groups, only: [:index]
        resources :artists, only: [:index]
      end

      namespace :views do
        resources :titles, only: [:index]
        resources :chapters, only: [:index]
        resources :pages, only: [:index]
      end

      namespace :titles do
        resources :bookmarks, only: [:index]
        resources :favorites, only: [:index]
        resources :views, only: [:index]
      end

      namespace :chapters do
        resources :bookmarks, only: [:index]
        resources :views, only: [:index]
      end

      namespace :pages do
        resources :bookmarks, only: [:index]
        resources :views, only: [:index]
      end

      namespace :groups do
        resources :favorites, only: [:index]
      end

      namespace :artists do
        resources :favorites, only: [:index]
      end
    end

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
    resources :users, only: [:index, :show]

    resources :artists, only: [:index, :show] do
      scope module: :artists do
        resources :favorites, only: [:create, :destroy]
      end
    end

    resources :writers, only: [:index, :show]
    resources :painters, only: [:index, :show]
    resources :cleaners, only: [:index, :show]
    resources :translators, only: [:index, :show]
    resources :editors, only: [:index, :show]
    resources :typers, only: [:index, :show]

    resources :groups, only: [:index, :show, :create, :update] do
      scope module: :groups do
        resources :users, only: [:index, :show, :create, :update, :destroy]
        resources :favorites, only: [:create, :destroy]
      end
    end

    resources :titles, only: [:index, :show, :create] do
      scope module: :titles do
        resource :to_draft, only: [:update], controller: :to_draft
        resource :to_review, only: [:update], controller: :to_review
        resource :to_published, only: [:update], controller: :to_published
        resource :cover, only: [:update, :destroy], controller: :cover
        resources :volumes, only: [:index, :show]
        resources :views, only: [:create]
        resources :bookmarks, only: [:create, :destroy]
        resources :favorites, only: [:create, :destroy]

        resources :chapters, only: [:index, :show, :create, :update, :destroy] do
          scope module: :chapters do
            resource :to_draft, only: [:update], controller: :to_draft
            resource :to_review, only: [:update], controller: :to_review
            resource :to_published, only: [:update], controller: :to_published
            resource :cover, only: [:update, :destroy], controller: :cover
            resources :views, only: [:create]
            resources :bookmarks, only: [:create, :destroy]

            resources :pages, only: [:index, :show, :create] do
              scope module: :pages do
                resources :views, only: [:create]
                resources :bookmarks, only: [:create, :destroy]
              end
            end
          end
        end
      end
    end
  end
end

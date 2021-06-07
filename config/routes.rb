Rails.application.routes.draw do
  root "frontend/home#index"

  resources :documentation, controller: :documentation, only: [:index]

  namespace :api, constraints: ->(request) { request.format == :json } do
    resource :sign_up, only: [:create], controller: :sign_up
    resource :sign_in, only: [:create], controller: :sign_in
    resource :sign_out, only: [:destroy], controller: :sign_out
    resources :locales, only: [:index, :show, :create, :destroy]
    resources :interface_languages, only: [:index, :show, :create, :update, :destroy]
    resources :content_languages, only: [:index, :show, :create, :update, :destroy]
    resources :access_rights, only: [:index, :show]
    resources :group_access_rights, only: [:index, :show]
    resources :marks, only: [:index, :show, :create, :update, :destroy]
    resources :genres, only: [:index, :show, :create, :update, :destroy]
    resources :themes, only: [:index, :show, :create, :update, :destroy]
    resources :formats, only: [:index, :show, :create, :update, :destroy]
    resources :demographics, only: [:index, :show, :create, :update, :destroy]
    resources :writers, only: [:show]
    resources :painters, only: [:show]
    resources :cleaners, only: [:show]
    resources :translators, only: [:show]
    resources :editors, only: [:show]
    resources :typers, only: [:show]
    resources :bookmarks, only: [:index]
    resources :favorites, only: [:index]
    resources :views, only: [:index]

    resources :tags, only: [:index, :show] do
      scope module: :tags do
        resource :translations, only: [:show]
      end
    end

    resources :artists, only: [:index, :show, :create, :update, :destroy] do
      scope module: :artists do
        resources :favorites, only: [:create, :destroy]
      end
    end

    resources :groups, only: [:index, :show, :create, :update] do
      scope module: :groups do
        resources :users, only: [:index, :show, :create, :update, :destroy]
        resources :favorites, only: [:create, :destroy]
      end
    end

    resources :titles, only: [:index, :show, :create, :destroy] do
      scope module: :titles do
        resource :to_draft, only: [:update], controller: :to_draft
        resource :to_review, only: [:update], controller: :to_review
        resource :to_published, only: [:update], controller: :to_published
        resource :cover, only: [:update, :destroy], controller: :cover
        resources :volumes, only: [:index, :show, :create, :update, :destroy]
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

    namespace :users do
      resource :settings, only: [:show, :update]
      resource :access_rights, only: [:show]

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
    end

    resources :users, only: [:index, :show] do
			scope module: :users do
        resource :access_rights, only: [:show, :update]
      end
    end
  end
end

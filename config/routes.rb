Rails.application.routes.draw do
  constraints -> (request) { request.format == :json } do
    resources :content_languages, only: [:index, :show]
  end
end

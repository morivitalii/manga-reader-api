class Api::Titles::ViewsController < Api::ApplicationController
  before_action :set_title, only: [:create]
  before_action -> { authorize(Api::Titles::ViewsPolicy) }, only: [:create]

  def create
    service = Api::Titles::CreateView.new(title: @title, user: Current.user)

    if service.call
      view = Api::TitleViewDecorator.decorate(service.view)
      view = Api::TitleViewSerializer.serialize(view)

      render json: view, status: 200
    else
      head 422
    end
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end
end

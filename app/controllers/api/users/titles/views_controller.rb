class Api::Users::Titles::ViewsController < Api::ApplicationController
  before_action -> { authorize(Api::Users::Titles::ViewsPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    service = Api::Users::Titles::FilterViews.new(filter_params)

    if service.call
      views = Api::TitleViewDecorator.decorate(service.views)
      views = Api::TitleViewSerializer.serialize(views)

      render json: views, status: 200
    else
      head 422
    end
  end

  private

  def set_user
    @user = Current.user
  end

  def filter_params
    permitted_attributes(Api::Users::Titles::ViewsPolicy, :index).merge(scope: views_scope)
  end

  def views_scope
    scope = @user.views.where(resource_type: "Title")

    policy_scope(Api::Users::Titles::ViewsPolicy, scope)
  end
end

class Api::Users::Pages::ViewsController < Api::ApplicationController
  before_action -> { authorize(Api::Users::Pages::ViewsPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    service = Api::Users::Pages::FilterViews.new(filter_params)

    if service.call
      views = Api::ViewDecorator.decorate(service.views)
      views = Api::ViewSerializer.serialize(views)

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
    permitted_attributes(Api::Users::Pages::ViewsPolicy, :index).merge(scope: views_scope)
  end

  def views_scope
    scope = @user.views.where(resource_type: "Page")

    policy_scope(Api::Users::Pages::ViewsPolicy, scope)
  end
end

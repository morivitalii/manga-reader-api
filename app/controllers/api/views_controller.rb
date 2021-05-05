class Api::ViewsController < Api::ApplicationController
  include Pagination

  before_action :set_user, only: [:index]

  before_action -> { authorize(Api::ViewsPolicy, user: @user) }, only: [:index]

  def index
    scope = views_scope.order(updated_at: :desc)
    service = Api::FilterViews.new(scope: scope, params: index_params)

    if service.call
      views = service.views

      # Apply pagination if filtering is not by ids
      unless index_params.resource_type_and_ids_context?
        views = paginate_countless(views)
      end

      views = Api::ViewDecorator.decorate(views)
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

  def views_scope
    policy_scope(Api::ViewsPolicy, @user.views)
  end

  def index_params
    permitted_attributes = permitted_attributes(Api::ViewsPolicy, :index)

    Api::Views::IndexParams.new(permitted_attributes.keys, permitted_attributes)
  end
end

class Api::GroupAccessRightsController < Api::ApplicationController
  before_action :set_group_access_right, only: [:show]

  before_action -> { authorize(Api::GroupAccessRightsPolicy) }, only: [:index]
  before_action -> { authorize(Api::GroupAccessRightsPolicy, access_right: @access_right) }, only: [:show]

  def index
    group_access_rights = group_access_rights_scope.all

    group_access_rights = Api::GroupAccessRightDecorator.decorate(group_access_rights)
    group_access_rights = Api::GroupAccessRightSerializer.serialize(group_access_rights)

    render json: group_access_rights, status: 200
  end

  def show
    access_right = Api::GroupAccessRightDecorator.decorate(@access_right)
    access_right = Api::GroupAccessRightSerializer.serialize(access_right)

    render json: access_right, status: 200
  end

  private

  def set_group_access_right
    @access_right = group_access_rights_scope.find(params[:id])
  end

  def group_access_rights_scope
    policy_scope(Api::GroupAccessRightsPolicy, GroupAccessRight)
  end
end

class Api::AccessRightsController < Api::ApplicationController
  include Pagination

  before_action :set_access_right, only: [:show]

  before_action -> { authorize(Api::AccessRightsPolicy) }, only: [:index]
  before_action -> { authorize(Api::AccessRightsPolicy, access_right: @access_right) }, only: [:show]

  def index
    access_rights = access_rights_scope.all
    
    access_rights = Api::AccessRightDecorator.decorate(access_rights)
    access_rights = Api::AccessRightSerializer.serialize(access_rights)

    render json: access_rights, status: 200
  end

  def show
    access_right = Api::AccessRightDecorator.decorate(@access_right)
    access_right = Api::AccessRightSerializer.serialize(access_right)

    render json: access_right, status: 200
  end

  private

  def set_access_right
    @access_right = access_rights_scope.find(params[:id])
  end

  def access_rights_scope
    policy_scope(Api::AccessRightsPolicy, AccessRight)
  end
end

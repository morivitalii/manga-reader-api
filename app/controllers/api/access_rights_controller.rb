class Api::AccessRightsController < Api::ApplicationController
  include Pagination

  before_action :set_artist, only: [:show]

  before_action -> { authorize(Api::AccessRightsPolicy) }, only: [:index]
  before_action -> { authorize(Api::AccessRightsPolicy, access_right: @access_right) }, only: [:show]

  def index
    artists = artists_scope.all
    
    artists = Api::AccessRightDecorator.decorate(artists)
    artists = Api::AccessRightSerializer.serialize(artists)

    render json: artists, status: 200
  end

  def show
    access_right = Api::AccessRightDecorator.decorate(@access_right)
    access_right = Api::AccessRightSerializer.serialize(access_right)

    render json: access_right, status: 200
  end

  private

  def set_artist
    @access_right = artists_scope.find(params[:id])
  end

  def artists_scope
    policy_scope(Api::AccessRightsPolicy, AccessRight)
  end
end

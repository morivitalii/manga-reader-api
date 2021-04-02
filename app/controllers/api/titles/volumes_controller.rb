class Api::Titles::VolumesController < Api::ApplicationController
  before_action :set_title, only: [:index, :show]
  before_action :set_volume, only: [:show]

  before_action -> { authorize(Api::Titles::VolumesPolicy) }, only: [:index]
  before_action -> { authorize(Api::Titles::VolumesPolicy, volume: @volume) }, only: [:show]

  def index
    volumes = volumes_scope.order("volumes.number ASC").all

    volumes = Api::VolumeDecorator.decorate(volumes)
    volumes = Api::VolumeSerializer.serialize(volumes)

    render json: volumes, status: 200
  end

  def show
    volume = Api::VolumeDecorator.decorate(@volume)
    volume = Api::VolumeSerializer.serialize(volume)

    render json: volume, status: 200
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def set_volume
    @volume = volumes_scope.find(params[:id])
  end
  
  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end

  def volumes_scope
    policy_scope(Api::Titles::VolumesPolicy, @title.volumes)
  end
end

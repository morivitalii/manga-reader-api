class Api::Titles::VolumesController < Api::ApplicationController
  before_action :set_title, only: [:index, :show, :create, :update, :destroy]
  before_action :set_volume, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::Titles::VolumesPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::Titles::VolumesPolicy, volume: @volume) }, only: [:show, :update, :destroy]

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

  def create
    service = Api::Titles::CreateVolume.new(create_params)

    if service.call
      volume = Api::VolumeDecorator.decorate(service.volume)
      volume = Api::VolumeSerializer.serialize(volume)

      render json: volume, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::Titles::UpdateVolume.new(update_params)

    if service.call
      volume = Api::VolumeDecorator.decorate(service.volume)
      volume = Api::VolumeSerializer.serialize(volume)

      render json: volume, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::Titles::DeleteVolume.new(volume: @volume)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def set_volume
    @volume = volumes_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::Titles::VolumesPolicy, :create).merge(title: @title)
  end

  def update_params
    permitted_attributes(Api::Titles::VolumesPolicy, :update).merge(volume: @volume)
  end
  
  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end

  def volumes_scope
    policy_scope(Api::Titles::VolumesPolicy, @title.volumes)
  end
end

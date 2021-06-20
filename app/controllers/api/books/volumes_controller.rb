class Api::Books::VolumesController < Api::ApplicationController
  before_action :set_book, only: [:index, :show, :create, :update, :destroy]
  before_action :set_volume, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::Books::VolumesPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::Books::VolumesPolicy, volume: @volume) }, only: [:show, :update, :destroy]

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
    service = Api::Books::CreateVolume.new(create_params)

    if service.call
      volume = Api::VolumeDecorator.decorate(service.volume)
      volume = Api::VolumeSerializer.serialize(volume)

      render json: volume, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::Books::UpdateVolume.new(update_params)

    if service.call
      volume = Api::VolumeDecorator.decorate(service.volume)
      volume = Api::VolumeSerializer.serialize(volume)

      render json: volume, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::Books::DeleteVolume.new(volume: @volume)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_book
    @book = books_scope.find(params[:book_id])
  end

  def set_volume
    @volume = volumes_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::Books::VolumesPolicy, :create).merge(book: @book)
  end

  def update_params
    permitted_attributes(Api::Books::VolumesPolicy, :update).merge(volume: @volume)
  end
  
  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end

  def volumes_scope
    policy_scope(Api::Books::VolumesPolicy, @book.volumes)
  end
end

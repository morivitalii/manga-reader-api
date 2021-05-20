class Api::DemographicsController < Api::ApplicationController
  before_action :set_demographic, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::DemographicsPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::DemographicsPolicy, demographic: @demographic) }, only: [:show, :update, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    query = demographic_scope.joins(tag: :translations).order("tag_translations.title ASC")
    cache_key = endpoint_cache_key(query)

    demographics = Rails.cache.fetch(cache_key) do
      demographics = query.all

      ActiveRecord::Associations::Preloader.new.preload(
        demographics, :tag, Tag.with_translations
      )

      demographics = Api::DemographicDecorator.decorate_collection(demographics)

      Api::DemographicSerializer.serialize(demographics).to_json
    end

    render json: demographics, status: 200
  end

  def show
    cache_key = endpoint_cache_key(@demographic)

    demographic = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @demographic, :tag, Tag.with_translations
      )

      demographic = Api::DemographicDecorator.decorate(@demographic)

      Api::DemographicSerializer.serialize(demographic).to_json
    end

    render json: demographic, status: 200
  end

  def create
    service = Api::CreateDemographic.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.demographic, [
        tag: Tag.translations_associations
      ]
      )

      demographic = Api::DemographicDecorator.decorate(service.demographic)
      demographic = Api::DemographicSerializer.serialize(demographic)

      render json: demographic, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateDemographic.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.demographic, [
        tag: Tag.translations_associations
      ]
      )

      demographic = Api::DemographicDecorator.decorate(service.demographic)
      demographic = Api::DemographicSerializer.serialize(demographic)

      render json: demographic, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteDemographic.new(demographic: @demographic)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_demographic
    @demographic = demographic_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::DemographicsPolicy, :create)
  end

  def update_params
    permitted_attributes(Api::DemographicsPolicy, :update).merge(demographic: @demographic)
  end

  def demographic_scope
    policy_scope(Api::DemographicsPolicy, Demographic)
  end
end

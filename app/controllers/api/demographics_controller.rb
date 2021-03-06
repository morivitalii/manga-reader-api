class Api::DemographicsController < Api::ApplicationController
  before_action :set_demographic, only: [:show]

  before_action -> { authorize(Api::DemographicsPolicy) }, only: [:index]
  before_action -> { authorize(Api::DemographicsPolicy, @demographic) }, only: [:show]

  def index
    query = demographics_scope.joins(tag: :translations).order("tag_translations.title ASC")
    cache_key = cache_key(query)

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
    cache_key = cache_key(@demographic)

    demographic = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @demographic, :tag, Tag.with_translations
      )

      demographic = Api::DemographicDecorator.decorate(@demographic)

      Api::DemographicSerializer.serialize(demographic).to_json
    end

    render json: demographic, status: 200
  end

  private

  def set_demographic
    @demographic = demographics_scope.find(params[:id])
  end

  def demographics_scope
    policy_scope(Api::DemographicsPolicy, Demographic)
  end
end

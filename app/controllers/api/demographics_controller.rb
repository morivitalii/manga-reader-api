class Api::DemographicsController < Api::ApplicationController
  before_action :set_demographic, only: [:show]
  before_action :set_demographic_associations, only: [:show]

  before_action -> { authorize(Api::DemographicsPolicy) }, only: [:index]
  before_action -> { authorize(Api::DemographicsPolicy, @demographic) }, only: [:show]

  def index
    demographics = demographics_scope.joins(tag: :translations).order("tag_translations.title ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      demographics, :tag, Tag.with_translations
    )

    demographics = Api::DemographicDecorator.decorate_collection(demographics)
    demographics = Api::DemographicSerializer.serialize(demographics)

    render json: demographics, status: 200
  end

  def show
    demographic = Api::DemographicDecorator.decorate(@demographic)
    demographic = Api::DemographicSerializer.serialize(demographic)

    render json: demographic, status: 200
  end

  private

  def set_demographic
    @demographic = demographics_scope.find(params[:id])
  end

  def demographics_scope
    policy_scope(Api::DemographicsPolicy, Demographic)
  end

  def set_demographic_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @demographic, :tag, Tag.with_translations
    )
  end
end

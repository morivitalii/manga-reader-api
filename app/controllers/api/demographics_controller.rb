class Api::DemographicsController < Api::ApplicationController
  before_action :set_demographic, only: [:show]
  before_action :set_demographic_associations, only: [:show]

  def index
    demographics = Demographic.joins(tag: :translations).order("tag_translations.title ASC").all

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
    @demographic = Demographic.find(params[:id])
  end

  def set_demographic_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @demographic, :tag, Tag.with_translations
    )
  end
end

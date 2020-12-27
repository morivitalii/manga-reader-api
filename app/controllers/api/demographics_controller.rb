class Api::DemographicsController < Api::ApplicationController
  before_action :set_demographic, only: [:show]
  before_action :set_demographic_associations, only: [:show]

  def index
    demographics = Demographic.joins(tag: :translations).order("tag_translations.title ASC").includes(
      tag: [
        translations: [
          content_language: :locale
        ]
      ]
    ).all

    demographics = Api::DemographicDecorator.decorate_collection(demographics)

    render json: Api::DemographicSerializer.serialize(demographics), status: 200
  end

  def show
    demographic = Api::DemographicDecorator.decorate(@demographic)

    render json: Api::DemographicSerializer.serialize(demographic), status: 200
  end

  private

  def set_demographic
    @demographic = Demographic.find(params[:id])
  end

  def set_demographic_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @demographic,
      [
        tag: [
          translations: [
            content_language: :locale
          ]
        ]
      ]
    )
  end
end
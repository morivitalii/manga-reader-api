class Api::Tags::TranslationsController < Api::ApplicationController
  before_action :set_tag, only: [:show]
  before_action :set_tag_associations, only: [:show]

  before_action -> { authorize(Api::Tags::TranslationsPolicy, @tag) }, only: [:show]

  def show
    tag = Api::TagDecorator.decorate(@tag)
    tag = Api::TranslationSerializer.serialize(tag)

    render json: tag, status: 200
  end

  private

  def set_tag
    @tag = Tag.find(params[:tag_id])
  end

  def set_tag_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @tag, Tag.translations_associations
    )
  end
end

class Api::Tags::TranslationsController < Api::ApplicationController
  before_action :set_tag, only: [:show]

  before_action -> { authorize(Api::Tags::TranslationsPolicy, tag: @tag) }, only: [:show]

  def show
    ActiveRecord::Associations::Preloader.new.preload(
      @tag, Tag.translations_associations
    )

    tag = Api::TagDecorator.decorate(@tag)
    tag = Api::TranslationSerializer.serialize(tag)

    render json: tag, status: 200
  end

  private

  def set_tag
    @tag = policy_scope(Api::Tags::TranslationsPolicy, Tag).find(params[:tag_id])
  end
end

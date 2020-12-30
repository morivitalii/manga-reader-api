class Api::TagsController < Api::ApplicationController
  before_action :set_tag, only: [:show]
  before_action :set_tag_associations, only: [:show]

  def index
    tags = Tag.joins(:translations).order("tag_translations.title ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      tags, Tag.translations_associations
    )

    tags = Api::TagDecorator.decorate_collection(tags)
    tags = Api::TagSerializer.serialize(tags)

    render json: tags, status: 200
  end

  def show
    tag = Api::TagDecorator.decorate(@tag)
    tag = Api::TagSerializer.serialize(tag)

    render json: tag, status: 200
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def set_tag_associations
    ActiveRecord::Associations::Preloader.new.preload(
    @tag, Tag.translations_associations
    )
  end
end
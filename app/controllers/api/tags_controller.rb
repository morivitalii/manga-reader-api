class Api::TagsController < Api::ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::TagsPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::TagsPolicy, tag: @tag) }, only: [:show, :update, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    tags = tag_scope.joins(:translations).order("tag_translations.title ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      tags, [
        Tag.translations_associations
      ]
    )

    tags = Api::TagDecorator.decorate_collection(tags)
    tags = Api::TagSerializer.serialize(tags)

    render json: tags, status: 200
  end

  def show
    ActiveRecord::Associations::Preloader.new.preload(
      @tag, [
        Tag.translations_associations
      ]
    )

    tag = Api::TagDecorator.decorate(@tag)
    tag = Api::TagSerializer.serialize(tag)

    render json: tag, status: 200
  end

  def create
    service = Api::CreateTag.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.tag, [
          Tag.translations_associations
        ]
      )

      tag = Api::TagDecorator.decorate(service.tag)
      tag = Api::TagSerializer.serialize(tag)

      render json: tag, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateTag.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.tag, [
          Tag.translations_associations
        ]
      )

      tag = Api::TagDecorator.decorate(service.tag)
      tag = Api::TagSerializer.serialize(tag)

      render json: tag, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteTag.new(tag: @tag)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_tag
    @tag = tag_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::TagsPolicy, :create)
  end

  def update_params
    permitted_attributes(Api::TagsPolicy, :update).merge(tag: @tag)
  end

  def tag_scope
    policy_scope(Api::TagsPolicy, Tag)
  end
end

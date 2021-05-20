class Api::MarksController < Api::ApplicationController
  before_action :set_mark, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::MarksPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::MarksPolicy, mark: @mark) }, only: [:show, :update, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    query = mark_scope.joins(tag: :translations).order("tag_translations.title ASC")
    cache_key = endpoint_cache_key(query)

    marks = Rails.cache.fetch(cache_key) do
      marks = query.all

      ActiveRecord::Associations::Preloader.new.preload(
        marks, :tag, Tag.with_translations
      )

      marks = Api::MarkDecorator.decorate_collection(marks)

      Api::MarkSerializer.serialize(marks).to_json
    end

    render json: marks, status: 200
  end

  def show
    cache_key = endpoint_cache_key(@mark)

    mark = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @mark, :tag, Tag.with_translations
      )

      mark = Api::MarkDecorator.decorate(@mark)

      Api::MarkSerializer.serialize(mark).to_json
    end

    render json: mark, status: 200
  end

  def create
    service = Api::CreateMark.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.mark, [
        tag: Tag.translations_associations
      ]
      )

      mark = Api::MarkDecorator.decorate(service.mark)
      mark = Api::MarkSerializer.serialize(mark)

      render json: mark, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateMark.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.mark, [
        tag: Tag.translations_associations
      ]
      )

      mark = Api::MarkDecorator.decorate(service.mark)
      mark = Api::MarkSerializer.serialize(mark)

      render json: mark, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteMark.new(mark: @mark)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_mark
    @mark = mark_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::MarksPolicy, :create)
  end

  def update_params
    permitted_attributes(Api::MarksPolicy, :update).merge(mark: @mark)
  end

  def mark_scope
    policy_scope(Api::MarksPolicy, Mark)
  end
end

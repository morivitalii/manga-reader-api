class Api::MarksController < Api::ApplicationController
  before_action :set_mark, only: [:show]

  before_action -> { authorize(Api::MarksPolicy) }, only: [:index]
  before_action -> { authorize(Api::MarksPolicy, @mark) }, only: [:show]

  def index
    query = marks_scope.joins(tag: :translations).order("tag_translations.title ASC")
    cache_key = cache_key(query)

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
    cache_key = cache_key(@mark)

    mark = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @mark, :tag, Tag.with_translations
      )

      mark = Api::MarkDecorator.decorate(@mark)

      Api::MarkSerializer.serialize(mark).to_json
    end

    render json: mark, status: 200
  end

  private

  def set_mark
    @mark = marks_scope.find(params[:id])
  end

  def marks_scope
    policy_scope(Api::MarksPolicy, Mark)
  end
end

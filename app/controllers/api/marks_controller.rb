class Api::MarksController < Api::ApplicationController
  before_action :set_mark, only: [:show]
  before_action :set_mark_associations, only: [:show]

  def index
    marks = Mark.joins(tag: :translations).order("tag_translations.title ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      marks, :tag, Tag.with_translations
    )

    marks = Api::MarkDecorator.decorate_collection(marks)
    marks = Api::MarkSerializer.serialize(marks)

    render json: marks, status: 200
  end

  def show
    mark = Api::MarkDecorator.decorate(@mark)
    mark = Api::MarkSerializer.serialize(mark)

    render json: mark, status: 200
  end

  private

  def set_mark
    @mark = Mark.find(params[:id])
  end

  def set_mark_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @mark, :tag, Tag.with_translations
    )
  end
end

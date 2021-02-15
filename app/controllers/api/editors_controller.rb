class Api::EditorsController < Api::ApplicationController
  include Pagination

  before_action :set_editor, only: [:show]
  before_action :set_editor_associations, only: [:show]

  before_action -> { authorize(Api::EditorsPolicy) }, only: [:index]
  before_action -> { authorize(Api::EditorsPolicy, @editor) }, only: [:show]

  def index
    editors = editor_scope.order(id: :asc)
    pagination, editors = paginate_countless(editors)

    set_pagination_headers(pagination)

    ActiveRecord::Associations::Preloader.new.preload(
      editors, [
        artist: Artist.translations_associations
      ]
    )

    editors = Api::EditorDecorator.decorate(editors)
    editors = Api::EditorSerializer.serialize(editors)

    render json: editors, status: 200
  end

  def show
    editor = Api::EditorDecorator.decorate(@editor)
    editor = Api::EditorSerializer.serialize(editor)

    render json: editor, status: 200
  end

  private

  def set_editor
    @editor = editor_scope.find(params[:id])
  end

  def editor_scope
    policy_scope(Api::EditorsPolicy, Editor)
  end

  def set_editor_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @editor, [
        artist: Artist.translations_associations
      ]
    )
  end
end

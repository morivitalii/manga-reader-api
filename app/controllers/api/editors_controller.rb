class Api::EditorsController < Api::ApplicationController
  include Pagination

  before_action :set_editor, only: [:show]

  before_action -> { authorize(Api::EditorsPolicy, editor: @editor) }, only: [:show]

  def show
    cache_key = endpoint_cache_key(@editor)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    editor = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      ActiveRecord::Associations::Preloader.new.preload(
        @editor, [
          artist: Artist.translations_associations
        ]
      )

      editor = Api::EditorDecorator.decorate(@editor)

      Api::EditorSerializer.serialize(editor).to_json
    end

    render json: editor, status: 200
  end

  private

  def set_editor
    @editor = editor_scope.find(params[:id])
  end

  def editor_scope
    policy_scope(Api::EditorsPolicy, Editor)
  end
end

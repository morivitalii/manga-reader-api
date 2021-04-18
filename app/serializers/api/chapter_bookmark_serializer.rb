class Api::ChapterBookmarkSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      user_id: model.user_id,
      chapter_id: model.chapter_id,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end

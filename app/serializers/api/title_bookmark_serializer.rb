class Api::TitleBookmarkSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      user_id: model.user_id,
      title_id: model.title_id,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end

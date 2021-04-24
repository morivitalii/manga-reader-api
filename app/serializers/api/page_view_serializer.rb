class Api::PageViewSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      user_id: model.user_id,
      page_id: model.page_id,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
class Api::ChapterSerializer < Api::ApplicationSerializer
  serialize_associations :pages, with: Api::PageSerializer

  def attributes
    {
      id: model.id,
      title_id: model.title_id,
      volume_id: model.volume_id,
      group_id: model.group_id,
      number: model.number,
      publication_status: model.publication_status,
      views_count: model.views_count,
      bookmarks_count: model.bookmarks_count,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end

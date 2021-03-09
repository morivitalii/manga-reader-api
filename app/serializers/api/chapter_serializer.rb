class Api::ChapterSerializer < Api::ApplicationSerializer
  serialize_associations :pages, with: Api::PageSerializer
  serialize_associations :bookmark, with: Api::BookmarkSerializer
  serialize_associations :view, with: Api::ViewSerializer

  def attributes
    {
      id: model.id,
      title_id: model.title_id,
      volume_id: model.volume_id,
      group_id: model.group_id,
      number: model.number,
      publication_status: model.publication_status,
      pages_count: model.pages_count,
      views_count: model.views_count,
      bookmarks_count: model.bookmarks_count,
      bookmark: bookmark,
      view: view,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end

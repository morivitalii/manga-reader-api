class Api::ChapterSerializer < Api::ApplicationSerializer
  serialize_associations :content_language, with: Api::ContentLanguageSerializer
  serialize_associations :title, with: Api::TitleSerializer
  serialize_associations :volume, with: Api::VolumeSerializer
  serialize_associations :cover, with: Api::PageSerializer
  serialize_associations :pages, with: Api::PageSerializer
  serialize_associations :user, with: Api::UserSerializer
  serialize_associations :group, with: Api::GroupSerializer
  serialize_associations :view, with: Api::ViewSerializer
  serialize_associations :bookmark, with: Api::BookmarkSerializer

  def attributes
    {
      id: model.id,
      content_language_id: model.content_language_id,
      title_id: model.title_id,
      volume_id: model.volume_id,
      cover_id: model.cover_id,
      user_id: model.user_id,
      group_id: model.group_id,
      number: model.number,
      status: model.status,
      pages_count: model.pages_count,
      views_count: model.views_count,
      bookmarks_count: model.bookmarks_count,
      created_at: model.created_at,
      updated_at: model.updated_at,
      content_language: content_language,
      volume: volume,
      cover: cover,
      user: user,
      group: group,
      view: view,
      bookmark: bookmark,
    }
  end
end

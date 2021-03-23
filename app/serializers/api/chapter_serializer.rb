class Api::ChapterSerializer < Api::ApplicationSerializer
  serialize_association :content_language, with: Api::ContentLanguageSerializer
  serialize_associations :title, with: Api::TitleSerializer
  serialize_associations :volume, with: Api::VolumeSerializer
  serialize_associations :pages, with: Api::PageSerializer
  serialize_associations :user, with: Api::UserSerializer
  serialize_associations :group, with: Api::GroupSerializer
  serialize_associations :view, with: Api::ViewSerializer

  def attributes
    {
      id: model.id,
      content_language_id: model.content_language_id,
      title_id: model.title_id,
      volume_id: model.volume_id,
      user_id: model.user_id,
      group_id: model.group_id,
      name: model.name,
      number: model.number,
      status: model.status,
      pages_count: model.pages_count,
      views_count: model.views_count,
      bookmarks_count: model.bookmarks_count,
      created_at: model.created_at,
      updated_at: model.updated_at,
      cover: cover,
      content_language: content_language,
      volume: volume,
      user: user,
      group: group,
      view: view
    }
  end

  private

  def cover
    return nil if model.cover.blank?

    {
      url: model.cover.url,
      filename: model.cover.filename,
      content_type: model.cover.content_type,
      width: model.cover.metadata[:width],
      height: model.cover.metadata[:height],
      byte_size: model.cover.byte_size,
      created_at: model.cover.created_at
    }
  end
end

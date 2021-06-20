class Api::BookSerializer < Api::ApplicationSerializer
  serialize_associations :resource_artists, with: Api::ResourceArtistSerializer
  serialize_associations :resource_tags, with: Api::ResourceTagSerializer
  serialize_associations :volumes, with: Api::VolumeSerializer
  serialize_associations :chapters, with: Api::ChapterSerializer

  def attributes
    {
      id: model.id,
      original_content_language_id: model.original_content_language_id,
      title: model.title,
      description: model.description,
      status: model.status,
      publication_status: model.publication_status,
      cover: cover,
      artists: resource_artists,
      tags: resource_tags
    }
  end

  private

  def cover
    return nil if model.cover.blank?

    {
      url: model.cover.url,
      content_type: model.cover.content_type,
      width: model.cover.metadata[:width],
      height: model.cover.metadata[:height]
    }
  end
end

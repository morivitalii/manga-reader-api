class Api::TitleSerializer < Api::ApplicationSerializer
  serialize_associations :writers, with: Api::WriterSerializer
  serialize_associations :painters, with: Api::PainterSerializer
  serialize_associations :genres, with: Api::GenreSerializer
  serialize_associations :formats, with: Api::FormatSerializer
  serialize_associations :demographics, with: Api::DemographicSerializer
  serialize_associations :marks, with: Api::MarkSerializer
  serialize_associations :themes, with: Api::ThemeSerializer
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
      sent_to_review_at: model.sent_to_review_at,
      published_at: model.published_at,
      deleted_at: model.deleted_at,
      created_at: model.created_at,
      views_count: model.views_count,
      favorites_count: model.favorites_count,
      cover: cover,
      writers: writers,
      painters: painters,
      genres: genres,
      formats: formats,
      demographics: demographics,
      marks: marks,
      themes: themes
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

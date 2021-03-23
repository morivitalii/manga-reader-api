class Api::TitleSerializer < Api::ApplicationSerializer
  serialize_association :original_content_language, with: Api::ContentLanguageSerializer
  serialize_associations :writers, with: Api::WriterSerializer
  serialize_associations :painters, with: Api::PainterSerializer
  serialize_associations :genres, with: Api::GenreSerializer
  serialize_associations :formats, with: Api::FormatSerializer
  serialize_associations :demographics, with: Api::DemographicSerializer
  serialize_associations :marks, with: Api::MarkSerializer
  serialize_associations :themes, with: Api::ThemeSerializer
  serialize_associations :volumes, with: Api::VolumeSerializer
  serialize_associations :chapters, with: Api::ChapterSerializer
  serialize_associations :favorite, with: Api::FavoriteSerializer
  serialize_associations :view, with: Api::ViewSerializer

  def attributes
    {
      id: model.id,
      title: model.title,
      description: model.description,
      status: model.status,
      publication_status: model.publication_status,
      views_count: model.views_count,
      bookmarks_count: model.bookmarks_count,
      favorites_count: model.favorites_count,
      created_at: model.created_at,
      updated_at: model.updated_at,
      original_content_language: original_content_language,
      cover: cover,
      writers: writers,
      painters: painters,
      genres: genres,
      formats: formats,
      demographics: demographics,
      marks: marks,
      themes: themes,
      favorite: favorite,
      view: view,
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

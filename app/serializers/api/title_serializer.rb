class Api::TitleSerializer < Api::ApplicationSerializer
  serialize_association :cover, with: Api::CoverSerializer
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
      title: model.title,
      description: model.description,
      publication_status: model.publication_status,
      created_at: model.created_at,
      updated_at: model.updated_at,
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
end

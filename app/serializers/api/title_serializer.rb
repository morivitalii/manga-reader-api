class Api::TitleSerializer < Api::ApplicationSerializer
  serialize_associations :writers, with: Api::WriterSerializer
  serialize_associations :painters, with: Api::PainterSerializer
  serialize_associations :genres, with: Api::GenreSerializer
  serialize_associations :formats, with: Api::FormatSerializer
  serialize_associations :demographics, with: Api::DemographicSerializer
  serialize_associations :marks, with: Api::MarkSerializer
  serialize_associations :themes, with: Api::ThemeSerializer

  def attributes
    {
      id: model.id,
      title: model.title,
      created_at: model.created_at,
      updated_at: model.updated_at,
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

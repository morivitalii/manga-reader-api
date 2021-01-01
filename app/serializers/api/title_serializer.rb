class Api::TitleSerializer < Api::ApplicationSerializer
  serialize_association :tags,
    with: Api::TagSerializer,
    except: [:created_at, :updated_at]

  serialize_association :genres,
    with: Api::GenreSerializer,
    except: [:created_at, :updated_at]

  serialize_association :formats,
    with: Api::FormatSerializer,
    except: [:created_at, :updated_at]

  serialize_association :demographics,
    with: Api::DemographicSerializer,
    except: [:created_at, :updated_at]

  serialize_association :marks,
    with: Api::MarkSerializer,
    except: [:created_at, :updated_at]

  serialize_association :themes,
    with: Api::ThemeSerializer,
    except: [:created_at, :updated_at]

  def attributes
    {
      id: model.id,
      title: model.title,
      created_at: model.created_at,
      updated_at: model.updated_at,
      tags: tags,
      genres: genres,
      formats: formats,
      demographics: demographics,
      marks: marks,
      themes: themes
    }
  end
end

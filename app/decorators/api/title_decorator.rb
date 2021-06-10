class Api::TitleDecorator < Api::ApplicationDecorator
  decorates_association :original_content_language, with: Api::ContentLanguageDecorator
  decorates_association :resource_artists, with: Api::ResourceArtistDecorator
  decorates_association :genres, with: Api::GenreDecorator
  decorates_association :formats, with: Api::FormatDecorator
  decorates_association :demographics, with: Api::DemographicDecorator
  decorates_association :marks, with: Api::MarkDecorator
  decorates_association :themes, with: Api::ThemeDecorator
  decorates_association :volumes, with: Api::VolumeDecorator
end

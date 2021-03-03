class Api::TitleDecorator < Api::ApplicationDecorator
  decorates_association :original_content_language, with: Api::ContentLanguageDecorator
  decorates_association :cover, with: Api::CoverDecorator
  decorates_association :writers, with: Api::WriterDecorator
  decorates_association :painters, with: Api::PainterDecorator
  decorates_association :genres, with: Api::GenreDecorator
  decorates_association :formats, with: Api::FormatDecorator
  decorates_association :demographics, with: Api::DemographicDecorator
  decorates_association :marks, with: Api::MarkDecorator
  decorates_association :themes, with: Api::ThemeDecorator
  decorates_association :volumes, with: Api::VolumeDecorator
end

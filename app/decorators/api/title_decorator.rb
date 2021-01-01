class Api::TitleDecorator < Api::ApplicationDecorator
  decorates_association :tags, with: Api::TagDecorator
  decorates_association :genres, with: Api::GenreDecorator
  decorates_association :formats, with: Api::FormatDecorator
  decorates_association :demographics, with: Api::DemographicDecorator
  decorates_association :marks, with: Api::MarkDecorator
  decorates_association :themes, with: Api::ThemeDecorator
end
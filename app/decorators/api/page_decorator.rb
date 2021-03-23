class Api::PageDecorator < Api::ApplicationDecorator
  decorates_association :chapter, with: Api::ChapterDecorator
  decorates_association :view, with: Api::ViewDecorator
end

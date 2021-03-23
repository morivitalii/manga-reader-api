class Api::PageDecorator < Api::ApplicationDecorator
  decorates_association :chapter, with: Api::ChapterDecorator
end

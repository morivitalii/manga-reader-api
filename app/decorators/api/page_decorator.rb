class Api::PageDecorator < Api::ApplicationDecorator
  decorates_association :chapter, with: Api::ChapterDecorator
  decorates_association :view, with: Api::ViewDecorator
  decorates_association :bookmark, with: Api::BookmarkDecorator
end

class Api::ChapterDecorator < Api::ApplicationDecorator
  decorates_association :title, with: Api::TitleDecorator
  decorates_association :volume, with: Api::VolumeDecorator
  decorates_association :group, with: Api::GroupDecorator
  decorates_associations :pages, with: Api::PageDecorator
  decorates_association :view, with: Api::ViewDecorator
  decorates_association :bookmark, with: Api::BookmarkDecorator
end

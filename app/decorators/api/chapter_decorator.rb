class Api::ChapterDecorator < Api::ApplicationDecorator
  decorates_association :content_language, with: Api::ContentLanguageDecorator
  decorates_association :title, with: Api::TitleDecorator
  decorates_association :volume, with: Api::VolumeDecorator
  decorates_associations :pages, with: Api::PageDecorator
  decorates_association :user, with: Api::UserDecorator
  decorates_association :group, with: Api::GroupDecorator
  decorates_association :view, with: Api::ViewDecorator
end

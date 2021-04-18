class Api::TitleBookmarkDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end

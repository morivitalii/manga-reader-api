class Api::BookmarkDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end

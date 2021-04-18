class Api::PageBookmarkDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end

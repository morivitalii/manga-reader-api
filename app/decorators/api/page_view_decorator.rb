class Api::PageViewDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end

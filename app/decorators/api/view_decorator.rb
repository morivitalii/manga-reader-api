class Api::ViewDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end

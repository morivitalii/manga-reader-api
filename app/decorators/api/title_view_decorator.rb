class Api::TitleViewDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end

class Api::ChapterViewDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end

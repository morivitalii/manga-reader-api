class Api::FavoriteDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end

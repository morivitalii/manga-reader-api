class Api::GroupFavoriteDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end

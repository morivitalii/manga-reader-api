class Api::TitleFavoriteDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end

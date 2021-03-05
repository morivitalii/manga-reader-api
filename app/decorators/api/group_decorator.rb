class Api::GroupDecorator < Api::ApplicationDecorator
  decorates_association :favorite, with: Api::FavoriteDecorator
end

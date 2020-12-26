class GenreDecorator < ApplicationDecorator
  decorates_association :tag, with: TagDecorator
end
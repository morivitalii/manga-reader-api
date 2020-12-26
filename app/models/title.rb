class Title < ApplicationRecord
  include Translation

  translates :title

  validates :title, presence: true
end
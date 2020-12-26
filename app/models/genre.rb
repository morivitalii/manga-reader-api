class Genre < ApplicationRecord
  belongs_to :tag

  validates :tag, uniqueness: true
end
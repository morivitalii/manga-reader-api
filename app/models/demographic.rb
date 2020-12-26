class Demographic < ApplicationRecord
  belongs_to :tag

  validates :tag, uniqueness: true
end
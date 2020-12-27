class Tag < ApplicationRecord
  include Translation

  has_one :demographic

  translates :title

  validates :title, presence: true
  validates :key, presence: true, uniqueness: true
end
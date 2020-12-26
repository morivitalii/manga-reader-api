class Tag < ApplicationRecord
  include Translation

  translates :title

  validates :title, presence: true
  validates :key, presence: true, uniqueness: { case_sensitive: false }
end
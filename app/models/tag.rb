class Tag < ApplicationRecord
  include Translation

  # This attributes should not be changed. Just because
  attr_readonly :key

  has_one :genre, dependent: :destroy
  has_one :format, dependent: :destroy
  has_one :demographic, dependent: :destroy
  has_one :mark, dependent: :destroy
  has_one :theme, dependent: :destroy

  translates :title

  validates :title, presence: true
  validates :key, presence: true, uniqueness: true
end

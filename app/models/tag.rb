class Tag < ApplicationRecord
  include Translation

  has_one :genre, dependent: :destroy
  has_one :format, dependent: :destroy
  has_one :demographic, dependent: :destroy

  translates :title

  validates :title, presence: true
  validates :key, presence: true, uniqueness: true
end
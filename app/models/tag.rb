class Tag < ApplicationRecord
  include Translation

  has_one :genre, dependent: :destroy
  has_one :format, dependent: :destroy
  has_one :demographic, dependent: :destroy
  has_one :mark, dependent: :destroy
  has_one :theme, dependent: :destroy

  has_many :resource_tags, dependent: :restrict_with_error
  has_many :titles, through: :resource_tags, source: :resource, source_type: "Title"

  translates :title

  validates :title, presence: true
  validates :key, presence: true, uniqueness: true
end
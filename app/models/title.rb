class Title < ApplicationRecord
  include Translation

  has_many :resource_tags, as: :resource, dependent: :destroy
  has_many :tags, through: :resource_tags
  has_many :genres, through: :tags
  has_many :formats, through: :tags
  has_many :demographics, through: :tags
  has_many :marks, through: :tags
  has_many :themes, through: :tags

  translates :title

  validates :title, presence: true
end

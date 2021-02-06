class Title < ApplicationRecord
  include Translation

  has_many :resource_writers, as: :resource, dependent: :destroy
  has_many :writers, through: :resource_writers

  has_many :resource_painters, as: :resource, dependent: :destroy
  has_many :painters, through: :resource_painters

  has_many :resource_genres, as: :resource, dependent: :destroy
  has_many :genres, through: :resource_genres

  has_many :resource_formats, as: :resource, dependent: :destroy
  has_many :formats, through: :resource_formats

  has_many :resource_demographics, as: :resource, dependent: :destroy
  has_many :demographics, through: :resource_demographics

  has_many :resource_marks, as: :resource, dependent: :destroy
  has_many :marks, through: :resource_marks

  has_many :resource_themes, as: :resource, dependent: :destroy
  has_many :themes, through: :resource_themes

  has_many :volumes, dependent: :destroy
  has_many :chapters, dependent: :destroy

  translates :title

  validates :title, presence: true, length: { minimum: 1, maximum: 125 }
end

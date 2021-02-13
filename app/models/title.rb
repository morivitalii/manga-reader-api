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

  belongs_to :cover, optional: true

  has_many :resource_covers, as: :resource, dependent: :destroy
  has_many :covers, through: :resource_covers

  translates :title, :description

  validates :cover, allow_blank: true, uniqueness: true, inclusion: { in: -> (record) { record.covers } }, if: -> (record) { record.cover.present? }
  validates :title, presence: true, length: { minimum: 1, maximum: 125 }
  validates :description, allow_blank: true, length: { minimum: 1, maximum: 5_000 }
end

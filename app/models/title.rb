class Title < ApplicationRecord
  include Translation

  belongs_to :original_content_language, optional: true, class_name: "ContentLanguage"
  belongs_to :cover, optional: true

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

  has_many :resource_covers, as: :resource, dependent: :destroy
  has_many :covers, through: :resource_covers

  has_many :views, as: :resource, dependent: :destroy
  has_many :bookmarks, as: :resource, dependent: :destroy

  translates :title, :description

  enum publication_status: { ongoing: 1, completed: 2, cancelled: 3 }

  validates :cover, allow_blank: true,
    uniqueness: true,
    inclusion: { in: -> (record) { record.covers } },
    if: -> (record) { record.cover.present? }

  validates :title, presence: true, length: { minimum: 1, maximum: 125 }
  validates :description, allow_blank: true, length: { minimum: 1, maximum: 5_000 }
  validates :publication_status, presence: true
end

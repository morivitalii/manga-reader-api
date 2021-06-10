class Title < ApplicationRecord
  include Translation
  include Search::Title

  ARTISTS_LIMIT = 100

  belongs_to :original_content_language, optional: true, class_name: "ContentLanguage"

  has_many :resource_artists, as: :resource, dependent: :destroy
  has_many :artists, through: :resource_artists

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

  has_many :favorites, as: :resource, dependent: :destroy
  has_many :bookmarks, as: :resource, dependent: :destroy
  has_many :views, as: :resource, dependent: :destroy

  has_one_attached :cover, service: :public

  translates :title, :description

  enum status: { draft: 1, review: 2, published: 3 }
  enum publication_status: { ongoing: 1, completed: 2, cancelled: 3 }

  validates :title, presence: true, length: { minimum: 1, maximum: 125 }
  validates :description, allow_blank: true, length: { minimum: 1, maximum: 5_000 }
  validates :status, presence: true
  validates :publication_status, presence: true
  validate :validate_artists_size

  private

  def validate_artists_size
    if artists.size > ARTISTS_LIMIT
      errors.add(:artists, :invalid)
    end
  end
end

class Book < ApplicationRecord
  include Translation
  include Search::Book

  ARTISTS_LIMIT = 100

  belongs_to :original_content_language, optional: true, class_name: "ContentLanguage"

  has_many :resource_artists, as: :resource, dependent: :destroy
  has_many :artists, through: :resource_artists

  has_many :resource_tags, as: :resource, dependent: :destroy
  has_many :tags, through: :resource_tags

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

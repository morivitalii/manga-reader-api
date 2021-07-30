class Chapter < ApplicationRecord
  include Search::Chapter

  ARTISTS_LIMIT = 100

  # This attributes should not be changed. Just because
  attr_readonly :book_id, :content_language_id, :group_id, :user_id, :number

  belongs_to :content_language
  belongs_to :book

  belongs_to :user
  belongs_to :group

  has_many :resource_artists, as: :resource, dependent: :destroy
  has_many :artists, through: :resource_artists

  has_many :pages, dependent: :destroy
  has_many :bookmarks, as: :resource, dependent: :destroy
  has_many :views, as: :resource, dependent: :destroy

  has_one_attached :cover, service: :public

  enum status: { draft: 1, review: 2, published: 3, deleted: 4 }

  validates :status, presence: true
  validates :title, allow_blank: true, length: { minimum: 1, maximum: 125 }
  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 }
  validates :volume, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1_000 }
  validate :validate_artists_size

  private

  def validate_artists_size
    if artists.size > ARTISTS_LIMIT
      errors.add(:artists, :invalid)
    end
  end
end

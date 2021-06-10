class Chapter < ApplicationRecord
  include CacheInvalidation

  ARTISTS_LIMIT = 100

  # This attributes should not be changed. Just because
  attr_readonly :title_id, :content_language_id, :volume_id, :group_id, :user_id, :number

  belongs_to :content_language
  belongs_to :title

  # optional: true because it could be that title still have no volumes
  belongs_to :volume, optional: true

  belongs_to :user
  belongs_to :group

  has_many :resource_artists, as: :resource, dependent: :destroy
  has_many :artists, through: :resource_artists

  has_many :pages, dependent: :destroy
  has_many :bookmarks, as: :resource, dependent: :destroy
  has_many :views, as: :resource, dependent: :destroy

  has_one_attached :cover, service: :public

  invalidate_association_cache :title
  invalidate_association_cache :volume
  invalidate_association_cache :user
  invalidate_association_cache :group

  enum status: { draft: 1, review: 2, published: 3, deleted: 4 }

  validates :status, presence: true
  validates :name, allow_blank: true, length: { minimum: 1, maximum: 125 }
  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 }
  validate :validate_volume_belongs_to_title
  validate :validate_artists_size

  private

  def validate_volume_belongs_to_title
    return if volume.blank?

    if title_id != volume.title_id
      errors.add(:volume_id, :invalid)
    end
  end

  def validate_artists_size
    if artists.size > ARTISTS_LIMIT
      errors.add(:artists, :invalid)
    end
  end
end

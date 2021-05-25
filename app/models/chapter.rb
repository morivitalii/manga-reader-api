class Chapter < ApplicationRecord
  include CacheInvalidation

  CLEANERS_LIMIT = 10
  TRANSLATORS_LIMIT = 10
  EDITORS_LIMIT = 10
  TYPERS_LIMIT = 10

  # This attributes should not be changed. Just because
  attr_readonly :title_id, :content_language_id, :volume_id, :group_id, :user_id, :number

  belongs_to :content_language
  belongs_to :title

  # optional: true because it could be that title still have no volumes
  belongs_to :volume, optional: true

  belongs_to :user
  belongs_to :group

  has_many :resource_cleaners, as: :resource, dependent: :destroy
  has_many :cleaners, through: :resource_cleaners

  has_many :resource_translators, as: :resource, dependent: :destroy
  has_many :translators, through: :resource_translators

  has_many :resource_editors, as: :resource, dependent: :destroy
  has_many :editors, through: :resource_editors

  has_many :resource_typers, as: :resource, dependent: :destroy
  has_many :typers, through: :resource_typers

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
  validate :validate_cleaners_size
  validate :validate_translators_size
  validate :validate_editors_size
  validate :validate_typers_size

  private

  def validate_volume_belongs_to_title
    return if volume.blank?

    if title_id != volume.title_id
      errors.add(:volume_id, :invalid)
    end
  end

  def validate_cleaners_size
    if cleaners.size > CLEANERS_LIMIT
      errors.add(:cleaners, :invalid)
    end
  end

  def validate_translators_size
    if translators.size > TRANSLATORS_LIMIT
      errors.add(:translators, :invalid)
    end
  end

  def validate_editors_size
    if editors.size > EDITORS_LIMIT
      errors.add(:editors, :invalid)
    end
  end

  def validate_typers_size
    if typers.size > TYPERS_LIMIT
      errors.add(:typers, :invalid)
    end
  end
end

class Chapter < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :title_id, :content_language_id, :volume_id, :group_id, :user_id, :number

  belongs_to :content_language
  belongs_to :title
  belongs_to :volume, optional: true
  belongs_to :user
  belongs_to :group
  belongs_to :cover, optional: true, class_name: "Page"

  has_many :pages, dependent: :destroy
  has_many :bookmarks, as: :resource, dependent: :destroy
  has_many :views, as: :resource, dependent: :destroy

  # Defined to preload signed in user bookmark
  has_one :bookmark, -> { where(user: Current.user) }, as: :resource

  # Defined to preload signed in user view
  has_one :view, -> { where(user: Current.user) }, as: :resource

  enum status: { draft: 1, review: 2, published: 3 }

  validates :cover,
    allow_blank: true,
    uniqueness: true,
    inclusion: { in: -> (record) { record.pages } },
    if: -> (record) { record.cover.present? }

  validates :status, presence: true
  validates :name, allow_blank: true, length: { minimum: 1, maximum: 125 }
  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 }
  validate :validate_volume_belongs_to_title
  validate :validate_user_belongs_to_group, on: :create

  private

  def validate_volume_belongs_to_title
    return if volume.blank?

    if title_id != volume.title_id
      errors.add(:volume_id, :invalid)
    end
  end

  def validate_user_belongs_to_group
    return if group.blank?
    return if user.blank?

    if GroupUser.where(user: user, group: group).none?
      errors.add(:group_id, :invalid)
    end
  end
end

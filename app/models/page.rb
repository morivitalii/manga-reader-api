class Page < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :chapter_id, :user_id, :number

  belongs_to :chapter, counter_cache: :pages_count
  belongs_to :user

  has_many :bookmarks, as: :resource, dependent: :destroy
  has_many :views, as: :resource, dependent: :destroy

  # Defined to preload signed in user bookmark
  has_one :bookmark, -> { where(user: Current.user) }, as: :resource

  # Defined to preload signed in user view
  has_one :view, -> { where(user: Current.user) }, as: :resource

  has_one_attached :file, service: :public

  validates :number,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10_000 },
    uniqueness: { scope: [:chapter_id] }

  validate :validate_user_belongs_to_chapter_group, on: :create

  private

  def validate_user_belongs_to_chapter_group
    return if chapter.blank?
    return if chapter.group.blank?
    return if user.blank?

    if GroupUser.where(user: user, group: chapter.group).none?
      errors.add(:user_id, :invalid)
    end
  end
end

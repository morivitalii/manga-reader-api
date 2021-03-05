class Group < ApplicationRecord
  has_many :group_user, dependent: :restrict_with_error
  has_many :users, through: :group_user
  has_many :chapters, dependent: :restrict_with_error
  has_many :volumes, through: :chapters
  has_many :titles, through: :volumes
  has_many :favorites, as: :resource, dependent: :destroy

  # Defined to preload signed in user favorite
  has_one :favorite, -> { where(user: Current.user) }, as: :resource

  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
end

class Group < ApplicationRecord
  has_many :group_user, dependent: :restrict_with_error
  has_many :users, through: :group_user
  has_many :chapters, dependent: :restrict_with_error
  has_many :volumes, through: :chapters
  has_many :titles, through: :volumes

  validates :title, presence: true
end

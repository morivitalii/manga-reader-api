class Group < ApplicationRecord
  include Search::Group

  has_many :group_users, dependent: :restrict_with_error
  has_many :users, through: :group_users
  has_many :chapters, dependent: :restrict_with_error
  has_many :volumes, through: :chapters
  has_many :books, through: :volumes
  has_many :favorites, as: :resource, dependent: :destroy

  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
end

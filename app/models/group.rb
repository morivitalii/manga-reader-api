class Group < ApplicationRecord
  has_many :group_user, dependent: :restrict_with_error
  has_many :users, through: :group_user

  validates :title, presence: true
end

class GroupAccessRight < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :key

  has_many :group_user_access_rights, dependent: :destroy
  has_many :group_users, through: :group_user_access_rights

  validates :key, presence: true, uniqueness: true
end

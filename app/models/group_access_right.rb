class GroupAccessRight < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :key

  has_many :group_user_access_rights, dependent: :destroy

  enum key: { manage_users: 1, manage_chapters: 2 }

  validates :key, presence: true, uniqueness: true
end

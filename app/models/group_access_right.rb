class GroupAccessRight < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :key

  has_many :group_user_access_rights, dependent: :destroy

  enum key: { manage_group: 1, manage_users: 2, manage_chapters: 3 }

  validates :key, presence: true, uniqueness: true
end

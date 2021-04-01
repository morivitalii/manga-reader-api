class GroupUser < ApplicationRecord
  include Translation

  # This attributes should not be changed. Just because
  attr_readonly :group_id, :user_id

  belongs_to :group, counter_cache: :users_count
  belongs_to :user

  has_many :group_user_access_rights, dependent: :destroy
  has_many :group_access_rights, through: :group_user_access_rights

  validates :user_id, uniqueness: { scope: [:group_id] }
end

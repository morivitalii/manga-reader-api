class AccessRight < ApplicationRecord
  include CacheInvalidation

  # This attributes should not be changed. Just because
  attr_readonly :key

  has_many :user_access_rights, dependent: :destroy
  has_many :users, through: :user_access_rights

  invalidate_association_cache :user_access_rights

  validates :key, presence: true, uniqueness: true
end

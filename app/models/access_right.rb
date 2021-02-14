class AccessRight < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :key

  has_many :user_access_rights, dependent: :destroy
  has_many :users, through: :user_access_rights

  validates :key, presence: true, uniqueness: { case_sensitive: false }
end

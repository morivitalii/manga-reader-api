class User < ApplicationRecord
  has_secure_password

  # This attributes should not be changed. Just because
  attr_readonly :username

  has_one :artist, dependent: :restrict_with_error
  has_many :group_user, dependent: :restrict_with_error
  has_many :groups, through: :group_user
  has_many :user_access_rights, dependent: :destroy
  has_many :access_rights, through: :user_access_rights
  has_many :views, dependent: :destroy

  validates :username, presence: true,
    format: {with: /\A[a-z0-9_-]{2,16}\z/i},
    uniqueness: {case_sensitive: false}

  validates :email, presence: true,
    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,64})\z/i},
    uniqueness: {case_sensitive: false}
end

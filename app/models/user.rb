class User < ApplicationRecord
  include Search::User

  has_secure_password :password, validations: false

  # This attributes should not be changed. Just because
  attr_readonly :username

  has_one :artist, dependent: :restrict_with_error
  has_one :user_setting, dependent: :restrict_with_error
  has_many :user_content_languages, dependent: :restrict_with_error
  has_many :content_languages, through: :user_content_languages, class_name: "ContentLanguage"
  has_many :user_excluded_tags, dependent: :restrict_with_error
  has_many :excluded_tags, through: :user_excluded_tags, source: :tag, class_name: "Tag"
  has_many :chapters, dependent: :restrict_with_error
  has_many :pages, dependent: :restrict_with_error
  has_many :group_users, dependent: :restrict_with_error
  has_many :groups, through: :group_users
  has_many :user_access_rights, dependent: :destroy
  has_many :access_rights, through: :user_access_rights
  has_many :views, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :username, presence: true,
    format: {with: /\A[a-z0-9_-]{2,16}\z/i},
    uniqueness: {case_sensitive: false}

  validates :email, presence: true,
    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,64})\z/i},
    uniqueness: {case_sensitive: false}

  validates :password, presence: true, length: { minimum: 6, maximum: 24 }, on: :create
end

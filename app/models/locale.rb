class Locale < ApplicationRecord
  # Key attribute should not be changed because a lot of things depends on it and changes will create chaos everywhere
  attr_readonly :key

  has_many :content_languages, dependent: :restrict_with_error
  has_many :interface_languages, dependent: :restrict_with_error

  validates :key, presence: true, uniqueness: { case_sensitive: false }
end
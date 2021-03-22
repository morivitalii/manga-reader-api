class Locale < ApplicationRecord
  # Key attribute should not be changed because a lot of things depends on it and changes will create chaos everywhere
  attr_readonly :key

  has_one :content_language, dependent: :restrict_with_error
  has_one :interface_language, dependent: :restrict_with_error

  validates :key, presence: true, length: { is: 2 }, uniqueness: {case_sensitive: false}
end

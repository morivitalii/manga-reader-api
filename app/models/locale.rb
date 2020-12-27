class Locale < ApplicationRecord
  has_many :content_languages, dependent: :restrict_with_error
  has_many :interface_languages    , dependent: :restrict_with_error

  validates :key, presence: true, uniqueness: { case_sensitive: false }
end
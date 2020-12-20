class Locale < ApplicationRecord
  validates :key, presence: true, uniqueness: { case_sensitive: false }
end
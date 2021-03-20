class ContentLanguage < ApplicationRecord
  include Translation

  # Locale association should not be changed because it will create mess with translations
  attr_readonly :locale_id

  belongs_to :locale

  has_many :chapters, dependent: :restrict_with_error
  has_many :users, dependent: :restrict_with_error

  translates :title

  validates :locale, uniqueness: true
  validates :title, presence: true, length: { minimum: 1, maximum: 25 }
end

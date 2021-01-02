class ContentLanguage < ApplicationRecord
  include Translation

  # Locale association should not be changed because it will create mess with translations
  attr_readonly :locale_id

  belongs_to :locale

  translates :title

  validates :locale, uniqueness: true
  validates :title, presence: true
end

class InterfaceLanguage < ApplicationRecord
  include Translation

  # Locale attribute should not be changed because it and will create confusions in user interfaces
  attr_readonly :locale_id

  belongs_to :locale

  translates :title

  validates :locale, uniqueness: true
  validates :title, presence: true
end
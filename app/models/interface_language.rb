class InterfaceLanguage < ApplicationRecord
  include Translation

  # Locale association should not be changed because it and will create confusions in user interfaces
  attr_readonly :locale_id

  belongs_to :locale

  has_many :user_settings, dependent: :restrict_with_error

  translates :title

  validates :locale, uniqueness: true
end

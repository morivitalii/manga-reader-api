class InterfaceLanguage < ApplicationRecord
  include Translation

  belongs_to :locale

  translates :title

  validates :locale, uniqueness: true
  validates :title, presence: true
end
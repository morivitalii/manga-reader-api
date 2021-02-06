class Artist < ApplicationRecord
  include Translation

  # This attributes should not be changed. Just because
  attr_readonly :user_id

  belongs_to :user, optional: true

  has_one :writer, dependent: :destroy
  has_one :painter, dependent: :destroy
  has_one :cleaner, dependent: :destroy
  has_one :translator, dependent: :destroy
  has_one :editor, dependent: :destroy
  has_one :typer, dependent: :destroy

  translates :name

  validates :name, presence: true, length: { minimum: 1, maximum: 64 }
  validates :user, uniqueness: true, allow_nil: true
end

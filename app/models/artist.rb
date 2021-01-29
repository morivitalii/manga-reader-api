class Artist < ApplicationRecord
  include Translation

  # This attributes should not be changed. Just because
  attr_readonly :user_id

  belongs_to :user, optional: true

  has_one :writer, dependent: :destroy

  translates :name

  validates :name, presence: true, length: { maximum: 64 }
  validates :user, uniqueness: true, allow_nil: true
end

class Volume < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :title_id, :number

  belongs_to :title

  has_many :chapters, dependent: :nullify

  validates :number,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1_000 },
    uniqueness: { scope: [:title_id] }
end

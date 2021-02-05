class Chapter < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :title_id, :volume_id, :number

  belongs_to :title
  belongs_to :volume
  belongs_to :group

  validates :number,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 },
    uniqueness: { scope: [:title_id, :group_id] }
end

class Chapter < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :title_id, :volume_id, :group_id, :number

  belongs_to :title
  belongs_to :volume, optional: true
  belongs_to :group

  has_many :pages, dependent: :destroy

  validates :number,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 },
    uniqueness: { scope: [:title_id, :group_id] }
end

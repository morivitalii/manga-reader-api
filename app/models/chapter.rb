class Chapter < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :title_id, :volume_id, :group_id, :number

  belongs_to :title
  belongs_to :volume, optional: true
  belongs_to :group
  belongs_to :cover, optional: true, class_name: "Page"

  has_many :pages, dependent: :destroy
  has_many :views, as: :resource, dependent: :destroy

  enum publication_status: { draft: 1, review: 2, published: 3 }

  validates :cover,
    allow_blank: true,
    uniqueness: true,
    inclusion: { in: -> (record) { record.pages } },
    if: -> (record) { record.cover.present? }

  validates :number,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 },
    uniqueness: { scope: [:title_id, :group_id] }
end

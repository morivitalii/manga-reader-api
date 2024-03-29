class Page < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :chapter_id, :user_id, :number

  belongs_to :chapter, counter_cache: :pages_count
  belongs_to :user

  has_many :bookmarks, as: :resource, dependent: :destroy
  has_many :views, as: :resource, dependent: :destroy

  has_one_attached :file, service: :public

  validates :number,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10_000 },
    uniqueness: { scope: [:chapter_id] }
end

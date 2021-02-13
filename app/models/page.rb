class Page < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :chapter_id, :cleaner_id, :translator_id, :editor_id, :typer_id, :number

  belongs_to :chapter
  belongs_to :cleaner, optional: true
  belongs_to :translator, optional: true
  belongs_to :editor, optional: true
  belongs_to :typer, optional: true

  has_one_attached :file, service: :private

  validates :number,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10_000 },
    uniqueness: { scope: [:chapter_id] }
end

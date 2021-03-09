class Page < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :chapter_id, :cleaner_id, :translator_id, :editor_id, :typer_id, :number

  belongs_to :chapter, counter_cache: :pages_count
  belongs_to :cleaner, optional: true
  belongs_to :translator, optional: true
  belongs_to :editor, optional: true
  belongs_to :typer, optional: true

  has_many :bookmarks, as: :resource, dependent: :destroy
  has_many :views, as: :resource, dependent: :destroy

  has_one :chapter_where_cover, class_name: "Chapter", foreign_key: :cover_id, dependent: :nullify

  # Defined to preload signed in user bookmark
  has_one :bookmark, -> { where(user: Current.user) }, as: :resource

  # Defined to preload signed in user view
  has_one :view, -> { where(user: Current.user) }, as: :resource

  has_one_attached :file, service: :private

  validates :number,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10_000 },
    uniqueness: { scope: [:chapter_id] }
end

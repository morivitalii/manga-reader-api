class Cover < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :content_language_id

  belongs_to :content_language

  has_many :resource_covers, dependent: :destroy
  has_one :title, dependent: :nullify
end
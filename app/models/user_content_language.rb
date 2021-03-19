class UserContentLanguage < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :user_id, :content_language_id

  belongs_to :user, touch: true
  belongs_to :content_language

  validates :user, uniqueness: {scope: [:content_language_id]}
end

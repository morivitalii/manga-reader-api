class Current < ActiveSupport::CurrentAttributes
  # Signed in user
  attribute :user

  # List of all content languages
  attribute :content_languages

  # Current request content language
  attribute :content_language

  # List of all interface languages
  attribute :interface_languages

  # Current request interface language
  attribute :interface_language
end

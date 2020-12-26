class Current < ActiveSupport::CurrentAttributes
  # List of all content languages
  attribute :content_languages

  # Current request content language
  attribute :content_language

  # Current request interface language
  attribute :interface_language
end

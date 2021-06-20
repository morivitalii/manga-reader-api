class Api::Books::ToDraft
  include ActiveModel::Model

  attr_accessor :book

  validate :validate_book_status

  def call
    validate!

    ActiveRecord::Base.transaction do
      book.update!(status: :draft)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  rescue ActiveModel::ValidationError => _invalid
    false
  end

  private

  def validate_book_status
    unless book.review?
      errors.add(:book, :invalid)
    end
  end
end
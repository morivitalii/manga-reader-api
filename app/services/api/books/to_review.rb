class Api::Books::ToReview
  include ActiveModel::Model

  attr_accessor :book

  validate :validate_book_status

  def call
    validate!

    ActiveRecord::Base.transaction do
      book.update!(
        status: :review,
        sent_to_review_at: Time.current
      )

      Search::Indexing::UpdateWorker.perform_async(book.class.name, book.id)
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
    unless book.draft?
      errors.add(:book, :invalid)
    end
  end
end
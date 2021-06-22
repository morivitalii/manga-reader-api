class Api::Books::Chapters::ToReview
  include ActiveModel::Model

  attr_accessor :chapter

  validate :validate_chapter_status

  def call
    validate!

    ActiveRecord::Base.transaction do
      chapter.update!(
        status: :review,
        sent_to_review_at: Time.current
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  rescue ActiveModel::ValidationError => _invalid
    false
  end

  private

  def validate_chapter_status
    unless chapter.draft?
      errors.add(:chapter, :invalid)
    end
  end
end
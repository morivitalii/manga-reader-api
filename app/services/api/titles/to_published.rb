class Api::Titles::ToPublished
  include ActiveModel::Model

  attr_accessor :title

  validate :validate_title_status

  def call
    validate!

    ActiveRecord::Base.transaction do
      title.update!(status: :published)
    end
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  rescue ActiveModel::ValidationError => _invalid
    false
  end

  private

  def validate_title_status
    unless title.review?
      errors.add(:title, :invalid)
    end
  end
end
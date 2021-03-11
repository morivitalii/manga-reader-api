class Api::Titles::Chapters::UpdateCover
  include ActiveModel::Model

  attr_accessor :chapter, :cover_id

  def call
    ActiveRecord::Base.transaction do
      chapter.update!(cover_id: cover_id)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
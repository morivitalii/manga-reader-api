class Api::Titles::Chapters::UpdateCover
  include ActiveModel::Model

  attr_accessor :chapter, :file

  def call
    ActiveRecord::Base.transaction do
      chapter.update!(cover: file)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
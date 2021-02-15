class Api::Titles::Chapters::DeleteCover
  include ActiveModel::Model

  attr_accessor :chapter

  def call
    ActiveRecord::Base.transaction do
      chapter.update!(cover: nil)

      true
    end
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
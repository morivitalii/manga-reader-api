class Api::Books::DeleteChapter
  include ActiveModel::Model

  attr_accessor :chapter

  def call
    ActiveRecord::Base.transaction do
      @chapter.update!(
        deleted_at: Time.current
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

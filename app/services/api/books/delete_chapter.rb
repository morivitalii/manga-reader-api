class Api::Books::DeleteChapter
  include ActiveModel::Model

  attr_accessor :chapter

  def call
    ActiveRecord::Base.transaction do
      @chapter.update!(
        status: :deleted,
        deleted_at: Time.current
      )
    end

    Search::Indexing::DeleteWorker.perform_async(@chapter.class.name, @chapter.id)

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

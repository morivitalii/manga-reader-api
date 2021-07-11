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

    # To know if we need to update object in elasticsearch,
    # please take a look for attributes and associations in index schema
    Search::Indexing::UpdateObjectWorker.perform_async(@chapter.class.name, @chapter.id)

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

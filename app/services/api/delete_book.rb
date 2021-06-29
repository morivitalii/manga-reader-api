class Api::DeleteBook
  include ActiveModel::Model

  attr_accessor :book

  def call
    ActiveRecord::Base.transaction do
      @book.update!(
        status: :deleted,
        deleted_at: Time.current
      )

      Search::Indexing::UpdateWorker.perform_async(@book.class.name, @book.id)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

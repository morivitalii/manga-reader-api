class Api::DeleteBook
  include ActiveModel::Model

  attr_accessor :book

  def call
    ActiveRecord::Base.transaction do
      @book.update!(
        deleted_at: Time.current
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

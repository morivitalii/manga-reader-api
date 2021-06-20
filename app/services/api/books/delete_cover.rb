class Api::Books::DeleteCover
  include ActiveModel::Model

  attr_accessor :book

  def call
    ActiveRecord::Base.transaction do
      book.update!(cover: nil)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
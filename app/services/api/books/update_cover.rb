class Api::Books::UpdateCover
  include ActiveModel::Model

  attr_accessor :book, :file

  def call
    ActiveRecord::Base.transaction do
      book.update!(cover: file)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
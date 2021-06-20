class Api::Books::Chapters::DeleteBookmark
  include ActiveModel::Model

  attr_accessor :bookmark

  def call
    ActiveRecord::Base.transaction do
      bookmark.destroy!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
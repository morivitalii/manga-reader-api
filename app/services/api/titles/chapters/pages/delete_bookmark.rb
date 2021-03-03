class Api::Titles::Chapters::Pages::DeleteBookmark
  include ActiveModel::Model

  attr_accessor :bookmark

  def call
    ActiveRecord::Base.transaction do
      bookmark.destroy!

      true
    end
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
class Api::Books::CreateBookmark
  include ActiveModel::Model

  attr_accessor :book, :user
  attr_reader :bookmark

  def call
    ActiveRecord::Base.transaction do
      @bookmark = Bookmark.lock.where(user: user, resource: book).take

      if @bookmark.present?
        @bookmark.destroy!
      end

      @bookmark = Bookmark.create!(
        user: user,
        resource: book
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
class Api::Titles::Chapters::CreateBookmark
  include ActiveModel::Model

  attr_accessor :chapter, :user
  attr_reader :bookmark

  def call
    ActiveRecord::Base.transaction do
      @bookmark = Bookmark.lock.where(user: user, resource: chapter).take

      if @bookmark.present?
        @bookmark.destroy!
      end

      @bookmark = Bookmark.create!(
        user: user,
        resource: chapter
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
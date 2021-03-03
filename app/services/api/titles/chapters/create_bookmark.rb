class Api::Titles::Chapters::CreateBookmark
  include ActiveModel::Model

  attr_accessor :chapter, :user

  def call
    ActiveRecord::Base.transaction do
      bookmark = Bookmark.lock.where(user: user, resource: chapter).take

      if bookmark.present?
        bookmark.destroy!
      end

      Bookmark.create(
        user: user,
        resource: chapter
      )
    end
  end
end
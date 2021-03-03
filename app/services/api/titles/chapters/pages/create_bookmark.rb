class Api::Titles::Chapters::Pages::CreateBookmark
  include ActiveModel::Model

  attr_accessor :page, :user

  def call
    ActiveRecord::Base.transaction do
      bookmark = Bookmark.lock.where(user: user, resource: page).take

      if bookmark.present?
        bookmark.destroy!
      end

      Bookmark.create(
        user: user,
        resource: page
      )
    end
  end
end
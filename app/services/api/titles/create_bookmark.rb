class Api::Titles::CreateBookmark
  include ActiveModel::Model

  attr_accessor :title, :user

  def call
    ActiveRecord::Base.transaction do
      bookmark = Bookmark.lock.where(user: user, resource: title).take

      if bookmark.present?
        bookmark.destroy!
      end

      Bookmark.create(
        user: user,
        resource: title
      )
    end
  end
end
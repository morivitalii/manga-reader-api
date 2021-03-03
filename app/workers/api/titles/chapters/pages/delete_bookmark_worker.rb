class Api::Titles::Chapters::Pages::DeleteBookmarkWorker
  include Sidekiq::Worker

  sidekiq_options(
    queue: :default,
    retry: false
  )

  def perform(bookmark_id)
    bookmark = Bookmark.find(bookmark_id)

    Api::Titles::Chapters::Pages::DeleteBookmark.new(bookmark: bookmark).call
  end
end
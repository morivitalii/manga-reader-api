class Api::Titles::Chapters::CreateBookmarkWorker
  include Sidekiq::Worker

  sidekiq_options(
    queue: :default,
    retry: false
  )

  def perform(page_id, user_id)
    page = Page.find(page_id)
    user = User.find(user_id)

    Api::Titles::Chapters::CreateBookmark.new(page: page, user: user).call
  end
end
class Api::Titles::Chapters::Pages::CreateViewWorker
  include Sidekiq::Worker

  sidekiq_options(
    queue: :views,
    retry: false
  )

  def perform(page_id, user_id)
    page = Page.find(page_id)
    user = User.find(user_id)

    Api::Titles::Chapters::Pages::CreateView.new(page: page, user: user).call
  end
end
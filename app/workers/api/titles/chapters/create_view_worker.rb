class Api::Titles::Chapters::CreateViewWorker
  include Sidekiq::Worker

  sidekiq_options(
    queue: :views,
    retry: false
  )

  def perform(chapter_id, user_id)
    chapter = Chapter.find(chapter_id)
    user = User.find(user_id)

    Api::Titles::Chapters::CreateView.new(chapter: chapter, user: user).call
  end
end
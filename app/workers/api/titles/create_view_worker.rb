class Api::Titles::CreateViewWorker
  include Sidekiq::Worker

  sidekiq_options(
    queue: :default,
    retry: false
  )

  def perform(title_id, user_id)
    title = Title.find(title_id)
    user = User.find(user_id)

    Api::Titles::CreateView.new(title: title, user: user).call
  end
end
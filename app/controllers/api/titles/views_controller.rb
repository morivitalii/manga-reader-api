class Api::Titles::ViewsController < Api::ApplicationController
  before_action :set_title, only: [:create]
  before_action -> { authorize(Api::Titles::ViewsPolicy) }, only: [:create]

  def create
    Api::Titles::CreateViewWorker.perform_async(@title.id, current_user.id)

    head 204
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end
end

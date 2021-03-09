class Api::Titles::ToDraftController < Api::ApplicationController
  before_action :set_title, only: [:update]

  before_action -> { authorize(Api::Titles::ToDraftPolicy, @title) }, only: [:update]

  def update
    service = Api::Titles::ToDraft.new(title: @title)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end
end

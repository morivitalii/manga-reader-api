class Api::Titles::ToReviewController < Api::ApplicationController
  before_action :set_title, only: [:update]

  before_action -> { authorize(Api::Titles::ToReviewPolicy, @title) }, only: [:update]

  def update
    service = Api::Titles::ToReview.new(title: @title)

    if service.call
      head 204
    else
      head 422
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

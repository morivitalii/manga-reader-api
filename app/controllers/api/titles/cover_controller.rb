class Api::Titles::CoverController < Api::ApplicationController
  before_action :set_title, only: [:update, :destroy]

  before_action -> { authorize(Api::Titles::CoverPolicy, @title) }, only: [:update, :destroy]

  def update
    service = Api::Titles::UpdateTitleCover.new(update_params)

    if service.call
      cover = Api::CoverDecorator.decorate(service.title.cover)
      cover = Api::CoverSerializer.serialize(cover)

      render json: cover, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::Titles::DeleteTitleCover.new(title: @title)

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

  def update_params
    permitted_attributes(Api::Titles::CoverPolicy, :update).merge(title: @title)
  end
end

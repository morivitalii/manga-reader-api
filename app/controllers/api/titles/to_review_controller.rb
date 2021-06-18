class Api::Titles::ToReviewController < Api::ApplicationController
  before_action :set_title, only: [:update]

  before_action -> { authorize(Api::Titles::ToReviewPolicy, title: @title) }, only: [:update]

  def update
    service = Api::Titles::ToReview.new(title: @title)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        @title, [
          Title.translations_associations,
          original_content_language: [
            :locale,
            ContentLanguage.translations_associations
          ],
          cover_attachment: :blob,
          resource_artists: { artist: Artist.translations_associations },
          resource_tags: { tag: Tag.translations_associations }
        ]
      )

      title = Api::TitleDecorator.decorate(@title)
      title = Api::TitleSerializer.serialize(title)

      render json: title, status: 200
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

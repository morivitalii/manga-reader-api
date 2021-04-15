class Api::Titles::ToPublishedController < Api::ApplicationController
  before_action :set_title, only: [:update]

  before_action -> { authorize(Api::Titles::ToPublishedPolicy, title: @title) }, only: [:update]

  def update
    service = Api::Titles::ToPublished.new(title: @title)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        @title, [
          Title.translations_associations,
          original_content_language: [
            :locale,
            ContentLanguage.translations_associations
          ],
          cover_attachment: :blob,
          writers: { artist: Artist.translations_associations },
          painters: { artist: Artist.translations_associations },
          genres: { tag: Tag.translations_associations },
          formats: { tag: Tag.translations_associations },
          demographics: { tag: Tag.translations_associations },
          marks: { tag: Tag.translations_associations },
          themes: { tag: Tag.translations_associations }
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

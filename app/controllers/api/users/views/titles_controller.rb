class Api::Users::Views::TitlesController < Api::ApplicationController
  include Pagination

  before_action -> { authorize(Api::Users::Views::TitlesPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    titles = titles_scope.joins(:views).where(views: {user: @user}).order("views.updated_at DESC")
    titles = paginate_countless(titles)

    ActiveRecord::Associations::Preloader.new.preload(
      titles, [
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

    titles = Api::TitleDecorator.decorate(titles)
    titles = Api::TitleSerializer.serialize(titles)

    render json: titles, status: 200
  end

  private

  def set_user
    @user = Current.user
  end

  def titles_scope
    policy_scope(Api::Users::Views::TitlesPolicy, Title)
  end
end

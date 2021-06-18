class Api::Users::Bookmarks::TitlesController < Api::ApplicationController
  include Pagination

  before_action -> { authorize(Api::Users::Bookmarks::TitlesPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    titles = titles_scope.joins(:bookmarks).where(bookmarks: {user: @user}).order("bookmarks.updated_at DESC")
    titles = paginate_countless(titles)

    ActiveRecord::Associations::Preloader.new.preload(
      titles, [
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

    titles = Api::TitleDecorator.decorate(titles)
    titles = Api::TitleSerializer.serialize(titles)

    render json: titles, status: 200
  end

  private

  def set_user
    @user = Current.user
  end

  def titles_scope
    policy_scope(Api::Users::Bookmarks::TitlesPolicy, Title)
  end
end

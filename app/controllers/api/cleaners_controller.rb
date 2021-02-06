class Api::CleanersController < Api::ApplicationController
  include Pagination

  before_action :set_cleaner, only: [:show]
  before_action :set_cleaner_associations, only: [:show]

  before_action -> { authorize(Api::CleanersPolicy) }, only: [:index]
  before_action -> { authorize(Api::CleanersPolicy, @cleaner) }, only: [:show]

  def index
    cleaners = cleaner_scope.order(id: :asc)
    pagination, cleaners = paginate_countless(cleaners)

    set_pagination_headers(pagination)

    ActiveRecord::Associations::Preloader.new.preload(
        cleaners, [
        artist: Artist.translations_associations
      ]
    )

    cleaners = Api::CleanerDecorator.decorate(cleaners)
    cleaners = Api::CleanerSerializer.serialize(cleaners)

    render json: cleaners, status: 200
  end

  def show
    cleaner = Api::CleanerDecorator.decorate(@cleaner)
    cleaner = Api::CleanerSerializer.serialize(cleaner)

    render json: cleaner, status: 200
  end

  private

  def set_cleaner
    @cleaner = cleaner_scope.find(params[:id])
  end

  def cleaner_scope
    policy_scope(Api::CleanersPolicy, Cleaner)
  end

  def set_cleaner_associations
    ActiveRecord::Associations::Preloader.new.preload(
        @cleaner, [
        artist: Artist.translations_associations
      ]
    )
  end
end

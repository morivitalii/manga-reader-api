class Api::Titles::CreateFavorite
  include ActiveModel::Model

  attr_accessor :title, :user
  attr_reader :favorite

  def call
    ActiveRecord::Base.transaction do
      favorite = Favorite.lock.where(user: user, resource: title).take

      if favorite.present?
        favorite.destroy!
      end

      @favorite = Favorite.create!(
        user: user,
        resource: title
      )
    end
  end
end
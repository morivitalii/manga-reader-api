class Api::Artists::CreateFavorite
  include ActiveModel::Model

  attr_accessor :artist, :user
  attr_reader :favorite

  def call
    ActiveRecord::Base.transaction do
      favorite = Favorite.lock.where(user: user, resource: artist).take

      if favorite.present?
        favorite.destroy!
      end

      @favorite = Favorite.create!(
        user: user,
        resource: artist
      )
    end
  end
end
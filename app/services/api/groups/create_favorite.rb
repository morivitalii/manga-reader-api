class Api::Groups::CreateFavorite
  include ActiveModel::Model

  attr_accessor :group, :user
  attr_reader :favorite

  def call
    ActiveRecord::Base.transaction do
      favorite = Favorite.lock.where(user: user, resource: group).take

      if favorite.present?
        favorite.destroy!
      end

      @favorite = Favorite.create!(
        user: user,
        resource: group
      )
    end

    true
  end
end
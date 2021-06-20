class Api::Books::CreateFavorite
  include ActiveModel::Model

  attr_accessor :book, :user
  attr_reader :favorite

  def call
    ActiveRecord::Base.transaction do
      favorite = Favorite.lock.where(user: user, resource: book).take

      if favorite.present?
        favorite.destroy!
      end

      @favorite = Favorite.create!(
        user: user,
        resource: book
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
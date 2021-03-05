class Api::Artists::DeleteFavorite
  include ActiveModel::Model

  attr_accessor :favorite

  def call
    ActiveRecord::Base.transaction do
      favorite.destroy!

      true
    end
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
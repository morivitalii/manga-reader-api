class Api::Books::DeleteFavorite
  include ActiveModel::Model

  attr_accessor :favorite

  def call
    ActiveRecord::Base.transaction do
      favorite.destroy!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
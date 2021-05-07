class Api::DeleteGenre
  include ActiveModel::Model

  attr_accessor :genre

  def call
    ActiveRecord::Base.transaction do
      genre.destroy!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

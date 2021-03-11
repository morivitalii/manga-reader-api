class Api::Titles::DeleteCover
  include ActiveModel::Model

  attr_accessor :cover

  def call
    ActiveRecord::Base.transaction do
      cover.destroy!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
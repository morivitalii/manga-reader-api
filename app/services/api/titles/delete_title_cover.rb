class Api::Titles::DeleteTitleCover
  include ActiveModel::Model

  attr_accessor :title

  def call
    ActiveRecord::Base.transaction do
      title.update!(cover: nil)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
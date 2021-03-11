class Api::Titles::UpdateTitleCover
  include ActiveModel::Model

  attr_accessor :title, :cover_id

  def call
    ActiveRecord::Base.transaction do
      title.update!(cover_id: cover_id)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
class Api::Titles::UpdateCover
  include ActiveModel::Model

  attr_accessor :title, :file

  def call
    ActiveRecord::Base.transaction do
      title.update!(cover: file)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
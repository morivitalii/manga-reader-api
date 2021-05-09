class Api::DeleteFormat
  include ActiveModel::Model

  attr_accessor :format

  def call
    ActiveRecord::Base.transaction do
      format.destroy!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

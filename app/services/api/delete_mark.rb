class Api::DeleteMark
  include ActiveModel::Model

  attr_accessor :mark

  def call
    ActiveRecord::Base.transaction do
      mark.destroy!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

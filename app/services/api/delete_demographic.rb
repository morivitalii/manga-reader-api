class Api::DeleteDemographic
  include ActiveModel::Model

  attr_accessor :demographic

  def call
    ActiveRecord::Base.transaction do
      demographic.destroy!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

class Api::DeleteLocale
  include ActiveModel::Model

  attr_accessor :locale

  def call
    ActiveRecord::Base.transaction do
      locale.destroy!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

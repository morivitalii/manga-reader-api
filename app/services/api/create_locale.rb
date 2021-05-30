class Api::CreateLocale
  include ActiveModel::Model

  attr_accessor :key

  attr_reader :locale

  def call
    ActiveRecord::Base.transaction do
      @locale = Locale.create!(key: key)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

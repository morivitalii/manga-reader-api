class Api::DeleteTheme
  include ActiveModel::Model

  attr_accessor :theme

  def call
    ActiveRecord::Base.transaction do
      theme.destroy!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

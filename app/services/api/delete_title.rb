class Api::DeleteTitle
  include ActiveModel::Model

  attr_accessor :title

  def call
    ActiveRecord::Base.transaction do
      @title.update!(
        deleted_at: Time.current
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

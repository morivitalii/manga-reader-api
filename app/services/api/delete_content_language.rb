class Api::DeleteContentLanguage
  include ActiveModel::Model

  attr_accessor :content_language

  def call
    ActiveRecord::Base.transaction do
      content_language.destroy!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

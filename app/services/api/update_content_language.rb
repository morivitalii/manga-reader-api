class Api::UpdateContentLanguage
  include ActiveModel::Model

  attr_accessor :content_language, :title

  def call
    ActiveRecord::Base.transaction do
      content_language.update!(
        title: title
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
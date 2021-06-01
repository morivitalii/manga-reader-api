class Api::UpdateContentLanguage
  include ActiveModel::Model

  attr_accessor :content_language, :title

  def call
    ActiveRecord::Base.transaction do
      content_language.assign_attributes(
        title: title
      )

      content_language.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
class Api::CreateContentLanguage
  include ActiveModel::Model

  attr_accessor :locale_id, :title

  attr_reader :content_language

  def call
    ActiveRecord::Base.transaction do
      @content_language = ContentLanguage.create!(
        locale_id: locale_id,
        title: title
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

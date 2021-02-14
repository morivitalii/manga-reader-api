class Api::Titles::CreateCover
  include ActiveModel::Model

  attr_accessor :title, :content_language_id, :file
  attr_reader :cover

  def call
    ActiveRecord::Base.transaction do
      @cover = Cover.create!(
        title: title,
        content_language_id: content_language_id,
        file: file
      )

      title.covers << cover

      true
    end
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
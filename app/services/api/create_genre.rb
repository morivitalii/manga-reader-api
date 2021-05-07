class Api::CreateGenre
  include ActiveModel::Model

  attr_accessor :key, :title, :description

  attr_reader :genre

  def call
    ActiveRecord::Base.transaction do
      tag = Tag.new(
        key: key,
        title: title,
        description: description
      )

      tag.save!

      @genre = Genre.create!(tag: tag)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

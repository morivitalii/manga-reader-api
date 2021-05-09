class Api::CreateFormat
  include ActiveModel::Model

  attr_accessor :key, :title, :description

  attr_reader :format

  def call
    ActiveRecord::Base.transaction do
      tag = Tag.new(
        key: key,
        title: title,
        description: description
      )

      tag.save!

      @format = Format.create!(tag: tag)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

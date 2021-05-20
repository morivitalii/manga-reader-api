class Api::CreateMark
  include ActiveModel::Model

  attr_accessor :key, :title, :description

  attr_reader :mark

  def call
    ActiveRecord::Base.transaction do
      tag = Tag.new(
        key: key,
        title: title,
        description: description
      )

      tag.save!

      @mark = Mark.create!(tag: tag)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

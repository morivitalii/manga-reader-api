class Api::CreateDemographic
  include ActiveModel::Model

  attr_accessor :key, :title, :description

  attr_reader :demographic

  def call
    ActiveRecord::Base.transaction do
      tag = Tag.new(
        key: key,
        title: title,
        description: description
      )

      tag.save!

      @demographic = Demographic.create!(tag: tag)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end

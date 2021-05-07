class Api::UpdateGenre
  include ActiveModel::Model

  attr_accessor :genre, :key, :title, :description

  def call
    ActiveRecord::Base.transaction do
      genre.tag.assign_attributes(
        key: key,
        title: title,
        description: description
      )

      genre.tag.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
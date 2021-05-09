class Api::UpdateFormat
  include ActiveModel::Model

  attr_accessor :format, :key, :title, :description

  def call
    ActiveRecord::Base.transaction do
      format.tag.assign_attributes(
        key: key,
        title: title,
        description: description
      )

      format.tag.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
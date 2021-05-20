class Api::UpdateMark
  include ActiveModel::Model

  attr_accessor :mark, :key, :title, :description

  def call
    ActiveRecord::Base.transaction do
      mark.tag.assign_attributes(
        key: key,
        title: title,
        description: description
      )

      mark.tag.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
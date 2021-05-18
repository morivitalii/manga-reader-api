class Api::UpdateDemographic
  include ActiveModel::Model

  attr_accessor :demographic, :key, :title, :description

  def call
    ActiveRecord::Base.transaction do
      demographic.tag.assign_attributes(
        key: key,
        title: title,
        description: description
      )

      demographic.tag.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
class Api::UpdateTheme
  include ActiveModel::Model

  attr_accessor :theme, :key, :title, :description

  def call
    ActiveRecord::Base.transaction do
      theme.tag.assign_attributes(
        key: key,
        title: title,
        description: description
      )

      theme.tag.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
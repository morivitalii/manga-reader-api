class Api::UpdateTag
	include ActiveModel::Model

	attr_accessor :tag, :key, :title, :description

	def call
		ActiveRecord::Base.transaction do
			tag.assign_attributes(
				key: key,
				title: title,
				description: description
			)

			tag.save!
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end
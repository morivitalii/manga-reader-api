class Api::UpdateTag
	include ActiveModel::Model

	attr_accessor :tag, :key, :title, :description

	def call
		ActiveRecord::Base.transaction do
			tag.update!(
				key: key,
				title: title,
				description: description
			)
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end
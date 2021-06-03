class Api::Users::UpdateAccessRights
	include ActiveModel::Model

	attr_accessor :user, :access_right_ids

	def call
		ActiveRecord::Base.transaction do
			user.update!(
				access_right_ids: access_right_ids
			)
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end

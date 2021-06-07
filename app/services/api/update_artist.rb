class Api::UpdateArtist
	include ActiveModel::Model

	attr_accessor :artist, :user_id, :name

	def call
		ActiveRecord::Base.transaction do
			artist.assign_attributes(
				user_id: user_id,
				name: name
			)

			artist.save!
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end
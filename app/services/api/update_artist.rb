class Api::UpdateArtist
	include ActiveModel::Model

	attr_accessor :artist, :user_id, :name

	def call
		ActiveRecord::Base.transaction do
			artist.update!(
				user_id: user_id,
				name: name
			)
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end
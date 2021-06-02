class Api::DeleteArtist
	include ActiveModel::Model

	attr_accessor :artist

	def call
		ActiveRecord::Base.transaction do
			artist.destroy!
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end

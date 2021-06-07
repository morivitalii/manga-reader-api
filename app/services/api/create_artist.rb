class Api::CreateArtist
	include ActiveModel::Model

	attr_accessor :user_id, :name

	attr_reader :artist

	def call
		ActiveRecord::Base.transaction do
			@artist = Artist.new(
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
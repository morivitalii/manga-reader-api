class Api::DeleteArtist
	include ActiveModel::Model

	attr_accessor :artist

	def call
		ActiveRecord::Base.transaction do
			artist.destroy!

			Search::Indexing::DeleteWorker.perform_async(artist.class.name, artist.id)
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end

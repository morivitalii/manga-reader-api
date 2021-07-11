class Api::DeleteArtist
	include ActiveModel::Model

	attr_accessor :artist

	def call
		ActiveRecord::Base.transaction do
			artist.destroy!

			# To know if we need to update object in elasticsearch,
			# please take a look for attributes and associations in index schema
			Search::Indexing::DeleteObjectWorker.perform_async(artist.class.name, artist.id)

			# To know if we need to update object in elasticsearch,
			# please take a look for attributes and associations in index schema
			Search::Indexing::UpdateObjectAssociationsWorker.perform_async(artist.class.name, artist.id, :books)
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end

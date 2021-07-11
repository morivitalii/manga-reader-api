class Api::UpdateArtist
	include ActiveModel::Model

	attr_accessor :artist, :user_id, :name

	def call
		ActiveRecord::Base.transaction do
			artist.update!(
				user_id: user_id,
				name: name
			)

			# To know if we need to update object in elasticsearch,
			# please take a look for attributes and associations in index schema
			Search::Indexing::UpdateObjectWorker.perform_async(artist.class.name, artist.id)

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
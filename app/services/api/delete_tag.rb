class Api::DeleteTag
	include ActiveModel::Model

	attr_accessor :tag

	def call
		ActiveRecord::Base.transaction do
			tag.destroy!

			# To know if we need to update object in elasticsearch,
			# please take a look for attributes and associations in index schema
			Search::Indexing::DeleteObjectWorker.perform_async(tag.class.name, tag.id)

			# To know if we need to update object in elasticsearch,
			# please take a look for attributes and associations in index schema
			Search::Indexing::UpdateObjectAssociationsWorker.perform_async(tag.class.name, tag.id, :books)
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end

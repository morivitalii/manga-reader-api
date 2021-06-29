class Api::DeleteTag
	include ActiveModel::Model

	attr_accessor :tag

	def call
		ActiveRecord::Base.transaction do
			tag.destroy!

			Search::Indexing::DeleteWorker.perform_async(tag.class.name, tag.id)
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end

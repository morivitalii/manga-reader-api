class Api::CreateTag
	include ActiveModel::Model

	attr_accessor :key, :title, :description

	attr_reader :tag

	def call
		ActiveRecord::Base.transaction do
			@tag = Tag.create!(
				key: key,
				title: title,
				description: description
			)

			Search::Indexing::CreateWorker.perform_async(@tag.class.name, @tag.id)
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end

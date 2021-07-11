class Search::Indexing::ReindexModel
	include ActiveModel::Model

	attr_accessor :class_name

	def call
		klass = class_name.classify.constantize

		if klass.__elasticsearch__.index_exists?
			klass.__elasticsearch__.delete_index!
		end

		klass.__elasticsearch__.create_index!

		klass.find_in_batches(batch_size: 1_000) do |batch|
			arguments = batch.map do |model|
				[class_name, model.id]
			end

			# Saves a lot of trips to redis
			Sidekiq::Client.push_bulk(
				"class" => Search::Indexing::CreateObjectWorker,
				"args" => arguments
			)
		end
	end
end
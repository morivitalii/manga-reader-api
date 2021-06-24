class Search::Reindex::Batch
	include ActiveModel::Model

	attr_accessor :class_name

	def call
		class_name.classify.constantize.find_in_batches(batch_size: 1_000) do |batch|
			arguments = batch.map do |model|
				[class_name, model.id]
			end

			# Saves a lot trips to redis
			Sidekiq::Client.push_bulk(
				"class" => Search::Reindex::SingleWorker,
				"args" => arguments
			)
		end
	end
end
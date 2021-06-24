class Search::Reindex::BatchWorker < ApplicationWorker
	sidekiq_options queue: :search, retry: false

	def perform(class_name)
		Search::Reindex::Batch.new(
			class_name: class_name
		).call
	end
end
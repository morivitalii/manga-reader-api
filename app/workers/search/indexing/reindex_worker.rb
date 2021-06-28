class Search::Indexing::ReindexWorker < ApplicationWorker
	sidekiq_options queue: :search, retry: false

	def perform(class_name)
		Search::Indexing::Reindex.new(class_name: class_name).call
	end
end
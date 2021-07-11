class Search::Indexing::ReindexModelWorker < ApplicationWorker
	sidekiq_options queue: :search, retry: false

	def perform(class_name)
		Search::Indexing::ReindexModel.new(class_name: class_name).call
	end
end
class Search::Indexing::DeleteWorker < ApplicationWorker
	sidekiq_options queue: :search, retry: false

	def perform(class_name, id)
		Search::Indexing::Delete.new(class_name: class_name, id: id).call
	end
end
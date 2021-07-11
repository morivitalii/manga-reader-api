class Search::Indexing::CreateObjectWorker < ApplicationWorker
	sidekiq_options queue: :search, retry: false

	def perform(class_name, id)
		Search::Indexing::CreateObject.new(class_name: class_name, id: id).call
	end
end
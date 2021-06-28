class Search::Indexing::CreateWorker < ApplicationWorker
	sidekiq_options queue: :search, retry: false

	def perform(class_name, id)
		Search::Indexing::Create.new(class_name: class_name, id: id).call
	end
end
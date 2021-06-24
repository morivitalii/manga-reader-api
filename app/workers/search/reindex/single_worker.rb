class Search::Reindex::SingleWorker < ApplicationWorker
	sidekiq_options queue: :search, retry: false

	def perform(class_name, id)
		Search::Reindex::Single.new(
			class_name: class_name,
			id: id
		).call
	end
end
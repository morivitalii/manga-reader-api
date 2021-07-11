class Search::Indexing::UpdateObjectAssociationsWorker < ApplicationWorker
	sidekiq_options queue: :search, retry: false

	def perform(class_name, id, *associations)
		Search::Indexing::UpdateObjectAssociations.new(
			id: id,
			class_name: class_name,
			associations: associations
		).call
	end
end
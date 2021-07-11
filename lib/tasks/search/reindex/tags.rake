namespace :search do
	namespace :reindex do
		desc "Reindex tags asynchronous"
		task tags: :environment do
			Search::Indexing::ReindexModelWorker.perform_async("Tag")
		end
	end
end
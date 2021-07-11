namespace :search do
	namespace :reindex do
		desc "Reindex groups asynchronous"
		task groups: :environment do
			Search::Indexing::ReindexModelWorker.perform_async("Group")
		end
	end
end
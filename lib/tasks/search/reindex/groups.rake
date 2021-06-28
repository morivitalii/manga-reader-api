namespace :search do
	namespace :reindex do
		desc "Reindex groups"
		task groups: :environment do
			Search::Indexing::ReindexWorker.perform_async("Group")
		end
	end
end
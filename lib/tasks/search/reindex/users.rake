namespace :search do
	namespace :reindex do
		desc "Reindex users"
		task users: :environment do
			Search::Indexing::ReindexWorker.perform_async("User")
		end
	end
end
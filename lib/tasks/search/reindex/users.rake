namespace :search do
	namespace :reindex do
		desc "Reindex users asynchronous"
		task users: :environment do
			Search::Indexing::ReindexModelWorker.perform_async("User")
		end
	end
end
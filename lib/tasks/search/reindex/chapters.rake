namespace :search do
	namespace :reindex do
		desc "Reindex chapters asynchronous"
		task chapters: :environment do
			Search::Indexing::ReindexModelWorker.perform_async("Chapter")
		end
	end
end
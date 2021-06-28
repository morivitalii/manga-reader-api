namespace :search do
	namespace :reindex do
		desc "Reindex chapters"
		task chapters: :environment do
			Search::Indexing::ReindexWorker.perform_async("Chapter")
		end
	end
end
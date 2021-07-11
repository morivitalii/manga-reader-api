 namespace :search do
	namespace :reindex do
		desc "Reindex artists asynchronous"
		task artists: :environment do
			Search::Indexing::ReindexModelWorker.perform_async("Artist")
		end
	end
end
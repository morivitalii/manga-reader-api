namespace :search do
	namespace :reindex do
		desc "Reindex books asynchronous"
		task books: :environment do
			Search::Indexing::ReindexModelWorker.perform_async("Book")
		end
	end
end
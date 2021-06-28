namespace :search do
	namespace :reindex do
		desc "Reindex books"
		task books: :environment do
			Search::Indexing::ReindexWorker.perform_async("Book")
		end
	end
end
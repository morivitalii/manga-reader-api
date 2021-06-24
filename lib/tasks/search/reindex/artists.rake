namespace :search do
	namespace :reindex do
		desc "Reindex artists"
		task artists: :environment do
			Search::Reindex::BatchWorker.perform_async("Artist")
		end
	end
end
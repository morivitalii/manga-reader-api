namespace :search do
	namespace :reindex do
		desc "Reindex chapters"
		task chapters: :environment do
			Search::Reindex::BatchWorker.perform_async("Chapter")
		end
	end
end
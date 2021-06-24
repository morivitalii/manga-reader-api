namespace :search do
	namespace :reindex do
		desc "Reindex tags"
		task tags: :environment do
			Search::Reindex::BatchWorker.perform_async("Tag")
		end
	end
end
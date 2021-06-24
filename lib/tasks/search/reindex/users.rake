namespace :search do
	namespace :reindex do
		desc "Reindex users"
		task users: :environment do
			Search::Reindex::BatchWorker.perform_async("User")
		end
	end
end
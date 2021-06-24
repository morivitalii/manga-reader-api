namespace :search do |_namespace|
	namespace :reindex do |namespace|
		desc "Run all search reindex tasks"
		task all: :environment do
			namespace.tasks.each do |task|
				Rake::Task[task].invoke
			end
		end
	end
end
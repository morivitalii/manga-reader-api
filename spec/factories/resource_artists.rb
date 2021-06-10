FactoryBot.define do
	factory :resource_artist do
		association :artist
		association :resource, factory: :title
		artist_type { :writer }

		factory :writer do
			artist_type { :writer }
		end

		factory :painter do
			artist_type { :painter }
		end

		factory :cleaner do
			artist_type { :cleaner }
		end

		factory :translator do
			artist_type { :translator }
		end

		factory :editor do
			artist_type { :editor }
		end

		factory :typer do
			artist_type { :typer }
		end
	end
end
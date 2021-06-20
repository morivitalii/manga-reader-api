FactoryBot.define do
	factory :resource_artist do
		association :artist
		association :resource, factory: :book
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

		factory :writer_resource_artist, traits: [:writer]
		factory :painter_resource_artist, traits: [:painter]
		factory :cleaner_resource_artist, traits: [:cleaner]
		factory :translator_resource_artist, traits: [:translator]
		factory :editor_resource_artist, traits: [:editor]
		factory :typer_resource_artist, traits: [:typer]
	end
end
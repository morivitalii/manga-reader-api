FactoryBot.define do
	factory :resource_tag do
		association :tag
		association :resource, factory: :title
		tag_type { :demographic }

		trait :demographic do
			tag_type { :demographic }
		end

		trait :format do
			tag_type { :format }
		end

		trait :genre do
			tag_type { :genre }
		end

		trait :mark do
			tag_type { :mark }
		end

		trait :theme do
			tag_type { :theme }
		end

		factory :demographic_resource_tag, traits: [:demographic]
		factory :format_resource_tag, traits: [:format]
		factory :genre_resource_tag, traits: [:genre]
		factory :mark_resource_tag, traits: [:mark]
		factory :theme_resource_tag, traits: [:theme]
	end
end
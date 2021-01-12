FactoryBot.define do
  factory :resource_artist do
    association :artist
    artist_type { ResourceArtist::WRITER }
    association :resource, factory: :title
  end
end

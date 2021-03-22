FactoryBot.define do
  factory :page do
    association :user
    association :chapter

    before(:create) do |object|
      create(:group_user, group: object.chapter.group, user: object.user)
    end

    file { Rack::Test::UploadedFile.new("spec/fixtures/page.jpg", "image/jpeg") }
    sequence(:number, 1) { |i| i }
  end
end

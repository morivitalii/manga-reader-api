source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails", "~> 6"
gem "rails-i18n", "~> 6"
gem "bootsnap", "~> 1", require: false
gem "puma", "~> 5"
gem "sidekiq", "~> 6"
gem "pg", "~> 1"
gem "hiredis", "~> 0"
gem "redis", "~> 4", require: ["redis", "redis/connection/hiredis"]
gem "elasticsearch-model", "~> 7"
gem "elasticsearch-rails", "~> 7"
gem "oj", "~> 3"
gem "webpacker"
gem "image_processing", "~> 1"
gem "bcrypt", "~> 3"
gem "rack-cors", "~> 1"
gem "warden", "~> 1"
gem "pundit", "~> 2"
gem "draper", "~> 4"
gem "hashie", "~> 4"
gem "pagy", "~> 3"
gem "active_storage_validations"

group :development, :test do
  gem "dotenv-rails", "~> 2"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "standard"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen"
  gem "spring"
end

group :test do
  gem "simplecov", require: false
  gem "shoulda-matchers"
  gem "rspec-sidekiq"
  gem "json_matchers"
  gem "faker"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

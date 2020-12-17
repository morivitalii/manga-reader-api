source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "rails", "~> 6"
gem "bootsnap", "~> 1", require: false
gem "puma", "~> 5"
gem "pg", "~> 1"
gem "oj", "~> 3"
gem "image_processing", "~> 1"
gem "bcrypt", "~> 3"
gem "rack-cors", "~> 1"

group :development, :test do
  gem "standard"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen"
  gem "spring"
end

group :test do
  gem "simplecov", require: false
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

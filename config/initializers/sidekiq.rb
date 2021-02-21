Sidekiq.configure_server do |config|
  config.redis = {url: ENV["SIDEKIQ_REDIS_URL"]}
  config.average_scheduled_poll_interval = 10
end

Sidekiq.configure_client do |config|
  config.redis = {url: ENV["SIDEKIQ_REDIS_URL"]}
end

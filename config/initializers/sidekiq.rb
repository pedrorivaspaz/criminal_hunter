# frozen_string_literal: true

host = ENV['REDIS_URL'] || 'redis://redis:6379/0'
Sidekiq.configure_server do |config|
  config.redis = { url: host }
end
Sidekiq.configure_client do |config|
  config.redis = { url: host }
end

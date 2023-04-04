# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq-failures'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

Sidekiq.configure_server do |config|
  config.failures_max_count = 5000
end
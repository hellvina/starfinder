# frozen_string_literal: true

source 'https://rubygems.org'

gem 'hanami', '~> 2.0'
gem 'hanami-router', '~> 2.0'
gem 'hanami-controller', '~> 2.0'
gem 'hanami-validations', '~> 2.0'
gem 'hanami-helpers'
gem 'hanami-assets'

gem 'dry-types', '~> 1.0', '>= 1.6.1'
gem 'puma'
gem 'rake'
gem 'json'
gem 'sidekiq', '~> 6.5.5'
gem 'sidekiq-failures'
gem 'rack'
gem 'rom'
gem 'rom-sql'
gem 'rom-repository'
gem 'pg'
gem 'github_api'

group :test do
  gem 'database_cleaner-sequel'
end

group :development, :test do
  gem 'dotenv'
  ### Debugger ###
  gem 'byebug'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'

  gem 'faker'
  gem 'rom-factory'
end

group :cli, :development do
  gem 'hanami-reloader'
end

group :cli, :development, :test do
  gem 'hanami-rspec'
end

group :development do
  gem 'guard-puma', '~> 0.8'
end

group :test do
  gem 'rack-test'
end

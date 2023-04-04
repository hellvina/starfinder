# frozen_string_literal: true

require 'rom/sql/rake_task'
require "hanami/prepare"

namespace :db do
  task :setup do
    Starfinder::App.prepare :persistence
    config = Starfinder::Container['persistence.config']
    ROM::SQL::RakeSupport.env = ROM.container(config)
  end
end

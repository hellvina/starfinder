# frozen_string_literal: true

require 'pathname'
SPEC_ROOT = Pathname(__dir__).realpath.freeze

ENV['HANAMI_ENV'] ||= 'test'
require 'hanami/prepare'

require_relative 'support/rspec'
require_relative 'support/requests'
require_relative 'support/database_cleaner'
require_relative 'support/factory'


RSpec.configure do |config|
  config.warnings = false

  config.order = :random
  Kernel.srand config.seed
end

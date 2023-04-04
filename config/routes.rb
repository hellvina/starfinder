# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq/web'
require 'rack'

Sidekiq::Web.use Rack::Session::Cookie, secret: '123456789'
Sidekiq::Web.use Rack::Session::Cookie, disabled: true

module Starfinder
  class Routes < Hanami::Routes
    root { 'Hello from Hanami' }

    get '/repositories', to: 'github_repositories.index'

    # Sidekiq web visualization
    mount Sidekiq::Web, at: '/sidekiq'
  end
end

# frozen_string_literal: true

require 'hanami'

module Starfinder
  class App < Hanami::App

    # Hanami actions don't allow json pase bady for default
    # so this allow action parse json body for requests 
    config.middleware.use :body_parser, :json
  end
end

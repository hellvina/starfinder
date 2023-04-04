# frozen_string_literal: true

require_relative '../../workers/search_repos'
require_relative '../../../lib/starfinder/repositories/github_repository'

module Starfinder
  module Actions
    module GithubRepositories
      class Index < Starfinder::Action
        handle_exception StandardError => :handle_standard_error
        before :validate_params

        params do
          required(:username).filled(:string)
          optional(:page).value(:integer, gteq?: 1)
          optional(:per_page).value(:integer, gteq?: 1, lteq?: 100)
        end

        def handle(request, response)
          response.status = 201

          Starfinder::Workers::SearchRepos.perform_async(request.params[:username])
          
          repositories = github_repository.list(request.params[:page], request.params[:per_page])
          response.body = repositories.to_json
        end

        private

        def github_repository
          Starfinder::Repositories::GithubRepository.new
        end

        def handle_standard_error(request, response)
          response.status = 500
          response.format = :json
          response.body = { error: 'Sorry, something went wrong handling your request' }.to_json
        end

        def validate_params(request, response)
          request.params
          halt 422, request.params.errors.to_h unless request.params.valid?
        end
      end
    end
  end
end

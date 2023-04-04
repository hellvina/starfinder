# frozen_string_literal: true

require 'sidekiq'
require 'starfinder/github_client'
require_relative '../../lib/starfinder/repositories/github_repository'

module Starfinder
  module Workers
    class SearchRepos
    include Sidekiq::Worker
      def perform(username)
        repositories = github_client(username)
        github_repository = Starfinder::Repositories::GithubRepository.new

        repositories.each do |data|
          existing_repo = github_repository.find_by_repo_name(data)

          github_repository.update(existing_repo[:id], data) if existing_repo
          github_repository.create_with_github_data(data)
        end
      end

      private 

      def github_client(username)
        client = Starfinder::GithubClient.new
        client.call(username)
      end
    end
  end
end

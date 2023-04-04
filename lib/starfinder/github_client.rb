# frozen_string_literal: true

require 'github_api'

module Starfinder
  class GithubClient
    def call(username)
      github = Github.new oauth_token:  ENV['GITHUB_ACCESS_TOKEN']
      github.repos.list user: username
    end

    private

    def base_url
      ENV['GITHUB_API_URL']
    end

    def token
      ENV['GITHUB_ACCESS_TOKEN']
    end

    def format_repository_data(repository_data)
      {
        name: repository_data['name'],
        stars: repository_data['stargazers_count'],
        user: repository_data['owner']['login']
      }
    end
  end
end



# frozen_string_literal: true

module Starfinder
  module Repositories
    class GithubRepository

      include Deps['persistence.rom']

      def find_by_repo_name(data)
        github_repositories.where(name: data[:name]).one
      end

      def create_with_github_data(data)
        github_repositories.changeset(:create, json_object(data)).commit
      end

      def update(id, data)
        github_repositories.by_pk(id).changeset(:update, json_object(data)).commit
      end

      def list(page, per_page)
        github_repositories
            .page(page || 1)
            .per_page(per_page || 5)
            .to_a
      end

      private 

      def json_object(data)
        repo_data = { name: data[:name], stars: data[:stargazers_count], user: data[:owner][:login] }
      end 

      def github_repositories
        rom.relations[:github_repositories]
      end
    end
  end
end

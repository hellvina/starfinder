# frozen_string_literal: true

module Starfinder
  module Persistence
    module Relations
      class GithubRepositories < ROM::Relation[:sql]
        schema(:github_repositories, infer: true)

        use :pagination
        per_page 5
      end
    end
  end
end

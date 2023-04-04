# frozen_string_literal: true

Factory.define(:github_repository) do |f|
  f.name Faker::Internet.slug
  f.stars Faker::Number.between(from: 1, to: 100) 
  f.user { Faker::Internet.unique.username }
end

# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Starfinder::Actions::GithubRepositories::Index do
  describe 'Integration service' do
    subject(:github_starfinder) { described_class.new }

    let(:username) { 'github_user' }
    let(:params) { { username: username } }


    context "when searching for a user's public repositories" do
      before { Factory[:github_repository, user: username] }

      let(:response) { github_starfinder.call(params) }
      
      it 'should return an array of repositories' do
        expect(response.body).to be_an(Array)
      end

      it 'should have names and stars' do 
        parsed_response =  JSON.parse(response.body.first)

        expect(parsed_response.first).to have_key("name")
        expect(parsed_response.first).to have_key("stars")
      end


      it 'should raise an error when an invalid username is provided' do
        expect { github_starfinder.handle('') }
          .to raise_error(StandardError)
      end
    end
  end
end

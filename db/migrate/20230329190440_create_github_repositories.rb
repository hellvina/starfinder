# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :github_repositories do
      primary_key :id
      column :name, String, null: false
      column :stars, Integer, null: false
      column :user, String, null: false
      column :created_at, DateTime, default: 'now()', null: false
      column :updated_at, DateTime, default: 'now()', null: false
    end
  end
end

# frozen_string_literal: true

class AddUsernameToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :first_name, :string, limit: 25
    add_column :accounts, :last_name, :string, limit: 25
    add_column :accounts, :username, :string, limit: 20
    remove_column :posts, :image
  end
end

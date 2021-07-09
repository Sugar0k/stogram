# frozen_string_literal: true

class AddImageToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :image_data, :text
    add_column :accounts, :description, :string
    add_column :accounts, :website, :string
  end
end

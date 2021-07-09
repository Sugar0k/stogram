# frozen_string_literal: true

class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.references :follower, reference: :accounts
      t.references :following, reference: :accounts
      t.timestamps
    end
  end
end

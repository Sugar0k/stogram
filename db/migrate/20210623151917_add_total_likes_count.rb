# frozen_string_literal: true

class AddTotalLikesCount < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :total_likes_count, :integer
    add_column :posts, :total_comments_count, :integer
  end
end

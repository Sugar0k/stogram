# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account

  validates_uniqueness_of :post_id, scope: :account_id

  after_create :increase_post_like_counter
  after_destroy :decrease_post_like_counter

  private

  def increase_post_like_counter
    Post.find(post_id).increment(:total_likes_count).save
  end

  # def increase_post_like_counter
  #   post = Post.find(self.post_id)
  #   if post.total_likes_count == nil
  #     post.total_likes_count = Like.where(post_id: post.id).count
  #   end
  #   increment(:total_likes_count).save
  # end

  def decrease_post_like_counter
    Post.find(post_id).decrement(:total_likes_count).save
  end
end

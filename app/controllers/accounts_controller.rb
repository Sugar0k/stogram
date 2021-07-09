# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]

  def index
    # user feed
    @posts = Post.active.limit 50
    @comment = Comment.new
  end

  def follow_account
    following_account_id = params[:follow_id]
    if Follower.create!(follower_id: current_account.id, following_id: following_account_id)
      flash[:success] = 'New following'
    else
      flash[:danger] = 'Fail'
    end
  end

  def profile
    @posts = @account.posts.active
  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end

  private

  def update_follower_suggestion; end
end

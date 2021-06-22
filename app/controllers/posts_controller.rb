class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.account_id = current_account.id if account_signed_in?

    if @post.save
      redirect_to dashboard_path, flash: { success: "Post was created successfully!" }
    else
      redirect_to new_posts_path, flash: { success: "Post was not saved!" }
    end
  end

  def show

  end

  private

  def post_params
    params.require(:post).permit(:image, :cached_image_data)
  end
end

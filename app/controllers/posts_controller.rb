class PostsController < ApplicationController
  def update
    if current_user.vip? || current_user.admin?
      @post = Post.find(params[:id])
      @post.update(posts_params)
    end
  end

  private

  def posts_params
    params.require(:post).permit(:content)
  end
end

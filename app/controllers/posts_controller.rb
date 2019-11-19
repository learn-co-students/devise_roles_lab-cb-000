class PostsController < ApplicationController
  before_action :current_user

  def show
    if current_user
      @post = Post.find(params[:post_id])
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if current_user.admin? || current_user.vip?
      @post.update(post_params)
      redirect_to @post
    else
      redirect_to @post, alert => 'Access denied.'
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:content)
  end
end

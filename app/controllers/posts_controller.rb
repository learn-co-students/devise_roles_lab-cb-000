class PostsController < ApplicationController
  before_action :user_authorized?, only: [:update]
  def update
    @post = Post.find_by(id: params[:id])
#    if current_user.admin? || current_user.vip?
      @post.update(post_params)
      redirect_to posts_path(@post)
#    else
#      redirect_to root_path
#    end

  end

  private
  def post_params
    params.require(:post).permit(:content)
  end


end

class PostsController < ApplicationController

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end

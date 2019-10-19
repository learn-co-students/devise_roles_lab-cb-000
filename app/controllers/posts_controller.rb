class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @post = Post.find_by_id(params[:id])
    if current_user.admin? || current_user.vip?
      @post.update(post_params)
       redirect_to @post
    else

      redirect_to posts_path
    end
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find_by_id(params[:id])
  end


end

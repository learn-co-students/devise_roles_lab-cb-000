class PostsController < ApplicationController
  def show
    @post = Post.find_by(id: params[:id])
  end
  def index
    @posts = Post.all
  end
  def edit
    if !current_user
      redirect_to '/home'
    end
    @post = Post.find_by(id: params[:id])
    if !current_user.admin? && @post.user_id != session[:user_id]
      redirect_to '/home'
    end
  end
  def update
    if !current_user
      redirect_to '/home'
    end
    @post = Post.find_by(id: params[:id])
    if !current_user.admin? && !current_user.vip? && @post.user_id != session[:user_id]
      redirect_to '/home'
    else
      @post.update(post_params)
    end
  end
  def new
    @post = Post.new
  end
  def create
  end
  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :new, :edit, :update, :destroy]
  before_action :permissions, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
  end

  private

  def permissions
    return head(:forbidden) unless current_user.admin? || current_user.vip?
  end

  def set_post
    @post = Post.find(params[:id]) || Post.new
  end

  def post_params
    params.require(:post).permit(:content)
  end

end

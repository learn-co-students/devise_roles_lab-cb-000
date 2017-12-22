class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post!, only: [:edit, :show, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update]
  before_action :admin_only!, only: [:destroy]


  def index
    @posts = Post.all
  end

  def show
  end

  def new
    render partial: 'form', locals: { post: Post.new }
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    post.save
    redirect_to post_path(post)
  end

  def edit
    render partial: 'form', locals: { post: @post }
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path, alert: 'Successfully deleted post.'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def authorize_user!
    redirect_to posts_path, alert: 'Access Denied' unless current_user == @post.user || current_user.admin? || current_user.vip?
  end

  def admin_only!
    redirect_to posts_path, alert: 'Access Denied.' unless current_user.admin?
  end

  def find_post!
    @post = Post.find(params[:id])
  end
end
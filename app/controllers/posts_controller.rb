class PostsController < ApplicationController

  def index
    @posts = Post.all
  end


  def new
    @post = Post.new
  end

  def create
    user_id = current_user.id
    @post = Post.create(content: params[:post][:content], user_id: user_id)
    redirect_to user_path(id: user_id)
  end

  def edit
    @post = Post.find(params[:id])
  end


  def show
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user == @post.user || current_user.vip? || current_user.admin?
    @post.update!(content: params[:post][:content])
    redirect_to post_path(id: @post.id)
  end
end

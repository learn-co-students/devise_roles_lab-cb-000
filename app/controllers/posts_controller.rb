class PostsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to posts_path, flash: {:errors => "Acces denied"}
  end

  def index
    @posts = Post.all
    render :index
  end

  def edit
    if @post = Post.find_by(:id => params[:id])
      render :edit
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find_by(:id => params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find_by(:id => params[:id])
    @post.delete
  end


  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end


end

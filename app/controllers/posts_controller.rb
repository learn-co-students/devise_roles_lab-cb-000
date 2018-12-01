class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    if !current_user.nil?
      @post = Post.new
    else
      redirect_to posts_path
    end
  end

  def create
    if !current_user.nil?
      @post = current_user.posts.create(post_params)
      redirect_to post_path(@post)
    else
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    if !@post.editable_by?(current_user)
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if !@post.editable_by?(current_user)
      return redirect_to posts_path
    end

    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if !@post.deleteable_by?(current_user)
      return redirect_to posts_path
    end

    @post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:content)
  end
end

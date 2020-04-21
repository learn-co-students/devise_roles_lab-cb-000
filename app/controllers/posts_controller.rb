class PostsController < ApplicationController
  load_and_authorize_resource
  def show
  end

  def create
    @post.save
    redirect_to @post
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end

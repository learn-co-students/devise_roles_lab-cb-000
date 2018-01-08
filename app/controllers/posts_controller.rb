class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    user_id = current_user.id

    Post.create(
      content: params[:post][:content],
      user_id: user_id
    )

    redirect_to user_path(id: user_id)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

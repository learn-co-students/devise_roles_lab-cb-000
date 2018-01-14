class PostsController < ApplicationController

  def new
  end

  def create
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    return redirect_to(post_path(@post), :alert => "Access denied.") unless current_user.admin? || current_user.vip? || current_user.try(:id) == @post.owner_id
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

end

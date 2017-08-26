class PostsController < ApplicationController


  def new

  end


  def create

  end

  def update
    if current_user.role == 'user'

      redirect_to root_path
    else

      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to root_path
    end


  end


  private

    def post_params
      params.require(:post).permit(:content, :user_id)
    end


end

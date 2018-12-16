class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :show, :update]
  before_action :authorize_user, only: [:edit, :update]

  def create
    Post.create(post_params)
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
    if current_user.admin? || current_user.vip?
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      return head(:forbidden)
    end
  end

  private

  def authorize_user
    raise "Unauthorized!" unless current_user

    unless current_user == @post.user || current_user.vip? || current_user.admin?
        redirect_to post_path(@post), :alert => "Access denied."
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end

end

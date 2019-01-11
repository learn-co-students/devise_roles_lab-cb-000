class UsersController < ApplicationController

  def index
    @users = User.all
  end

   def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to posts_path
    end
  end

   def destroy
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to posts_path
    else
      @user.destroy
      redirect_to posts_path
    end
  end

end

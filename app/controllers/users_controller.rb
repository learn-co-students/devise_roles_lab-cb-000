class UsersController < ApplicationController
  def index

  end

  def new

  end

  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      flash[:error] = "Access denied."
      redirect_to users_path
    end
  end

  def create

  end

  def destroy
    if current_user.admin?
      @user = User.find(params[:id])
      @user.destroy
    end
  end

  def update

  end
end

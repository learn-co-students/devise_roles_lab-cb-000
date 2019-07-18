class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to users_path, :alert => "Access denied."
      end
    end
  end


  def create
  end

  def edit
  end

  def update
  end


  def destroy
    if current_user.admin?
      @user = User.find_by(params[:id])
      @user.destroy
    end
  end


end

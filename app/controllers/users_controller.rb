class UsersController < ApplicationController
  def new
  end
  def create
  end
  def show
    @user = User.find_by(id: params[:id])
    if !@user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
    if !current_user.admin? && current_user != @user
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def index
    @current_user = current_user
  end
  def edit
  end
  def update
  end
  def destroy
    if !current_user
      redirect_to '/home'
    end
    @user = User.find_by(id: params[:id])
    if @user == current_user || current_user.admin?
      @user.destroy
    else
      redirect_to '/home'
    end
  end

end

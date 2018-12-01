class UsersController < ApplicationController
  def index
    if current_user && current_user.viewable?
      @user = current_user
    else
      redirect_to home_path
    end
  end
  
  def show
    if current_user && current_user.viewable? && current_user.id_is?(params[:id])
      @user = current_user
    else
      flash[:notice] = "Access denied."
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user && current_user && current_user.admin?
      @user.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
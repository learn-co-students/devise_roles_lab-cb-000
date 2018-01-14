class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    return redirect_to(:back, :alert => "Access denied.") unless current_user.admin? || current_user.try(:id) == @user.id
  end

  def destroy
    @user = User.find(params[:id])
    return redirect_to(user_path(@user), :alert => "Access denied.") unless current_user.admin?
    @user.destroy
    redirect_to '/'
  end
end

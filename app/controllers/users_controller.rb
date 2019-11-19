class UsersController < ApplicationController
  before_action :current_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user != current_user || !current_user.admin?
      redirect_to '/', :alert => "Access denied."
    end
  end
  
  def destroy
    if current_user.admin?
      User.find(params[:id]).delete
      redirect_to '/'
    end
  end
end

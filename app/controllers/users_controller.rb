class UsersController < ApplicationController

  #add authentication and authorization filters
  #only administrators can update or destroy users

  before_action :all_users, except: [:create, :index, :new]
  before_action :admin, only: [:show, :destroy]


  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def admin
    unless current_user.admin? || @user == current_user
     flash[:notice] = "Access denied."
     redirect_to users_path
   end
  end

  def all_users
    @user = User.find(params[:id])
  end

end

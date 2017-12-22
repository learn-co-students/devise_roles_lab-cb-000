class UsersController < ApplicationController
  before_action :set_user!, except: [:create, :index, :new]
  before_action :authenticate_user!, except: [:create, :new]
  before_action :admin_only!, only: [:destroy]
  before_action :admin_or_owner!, only: [:show]

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create

  end


  def destroy
    @user.destroy
    redirect_to users_path, alert: 'User deleted'
  end


  private

  def admin_only!
    redirect_to users_path, alert: 'Access denied.' unless current_user.admin?
  end

  def admin_or_owner!
    redirect_to users_path, alert: 'Access denied.' unless current_user.admin? || current_user == @user
  end

  def set_user!
    @user = User.find(params[:id])
  end
end
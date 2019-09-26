class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :index]
  before_action :set_user
  before_action :user_authorized?, only: [:update, :show]
  before_action :admin_only, only: :destroy
  def index
    @user = current_user || User.new
  end

  def show
#    @user = User.find_by(id: params[:id])
#    if current_user.admin? || current_user.vip? || current_user == @user
#      render 'show'
#    else
#      flash[:alert] = "Access denied."
#      render 'index'
#    end
  end

  def create

  end

  def update
#    if current_user.admin?
#      User.find_by(id: params[:id]).update(user_params)
      @user.update(user_params)
      redirect_to root_path
#    else
#      redirect_to root_path
#    end
  end

  def destroy
#    if current_user.admin?
#      User.find_by(id: params[:id]).destroy
    @user.destroy
    redirect_to root_path
#    else
#      flash[:notice] = "Access denied."
#      render 'index'
#    end
  end


end

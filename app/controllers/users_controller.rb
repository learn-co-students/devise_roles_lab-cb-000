class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new, :create, :index]

  def index
    @users = User.all
  end

  def show
    unless current_user.admin?
     unless @user == current_user
       redirect_to :back, :alert => "Access denied."
     end
   end
  end

  def edit
    if @user && @user != current_user
      redirect_to root_path, alert: "Access denied."
    end
  end

  def update

  end


  def destroy
    if current_user.admin?
      @user.destroy
    end
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end


end
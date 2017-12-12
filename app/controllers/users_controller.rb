class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  before_action :set_user!, except: [:create, :index, :new]
  before_action :admin_only, only: :destroy

  def new
  end

  def create
  end

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

  def update
  end

  def destroy
    @user.destroy

    redirect_to root_path
  end

  private

  def admin_only
    unless current_user.admin? 
      redirect_to root_path, :flash => {:notice => "Signed out successfully."}

    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

  def set_user!
  	@user = User.find(params[:id])
  end
end
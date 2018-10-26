class UsersController < ApplicationController
  before_action :authorize_user, only: [:show, :destroy]
  def new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'show'
  end

  def show
    @user = User.find_by(params[:id])
  end

  def destroy
    User.find_by(params[:id]).destroy
    redirect_to users_path, notice: "User deleted."
  end


  private
  def authorize_user
    if current_user.id != params[:id].to_i and !current_user.admin?
      redirect_to root_path, alert: "Access denied."
    end
  end

  def user_params
    params.require(:user).permit(:id, :name)
  end
end

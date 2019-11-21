class UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
  end

  def show
    if current_user.id != params[:id]
      redirect_to users_path, notice: 'Access denied'
    else
      @user = User.find(params[:id])
    end
  end

  def index
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end
end

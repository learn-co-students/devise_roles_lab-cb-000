class UsersController < ApplicationController

  def index

    if current_user.present?
    @user = User.find(current_user.id)
  else
    render 'layouts/application'
  end
  end

  def show
    if current_user.id == params[:id]
    @user = User.find(params[:id])
  else
    flash[:alert] = "Access denied."
    @user = User.find(current_user.id)
  end

  end

  def destroy

    if current_user.role != 'admin'

      redirect_to root_path
    else

      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:email)
  end

end

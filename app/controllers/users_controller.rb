class UsersController < ApplicationController

  before_action :authenticate_user!, :only => [:show, :destroy]
  load_and_authorize_resource :only => [:show, :destroy]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :flash => {error: "Access denied. your are not allowed to access this page!"}
  end

  def index
    render :index
  end

  def show
    @user = User.find_by(:id => params[:id])
  end

  def destroy
    if @user = User.find_by(id: params[:id])
      @user.delete
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email, :emial_confirmation, :role)
  end

end

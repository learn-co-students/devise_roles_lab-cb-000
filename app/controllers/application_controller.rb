class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def admin_only
    if !current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def user_authorized?
    if !current_user.admin? && !current_user.vip? && current_user != @user
      redirect_to root_path, :alert => "Access denied."
    end
  end

end

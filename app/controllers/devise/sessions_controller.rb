class Devise::SessionsController < ApplicationController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
      @user = User.new
   end


   #POST /resource/sign_in
   def create

      if @user = User.find_by(:email => user_params[:email])
         if @user.valid_password?(user_params[:password])
            sign_in(:user, @user)
            redirect_to user_path(@user), :flash => {:notice => "Signed in successfully."}
         else
            redirect_to new_user_session_path, :flash => {:error => "Invalid email or password."}
         end
      else
         redirect_to new_user_session_path, :flash => {:error => "Invalid email or password."}
      end

   end

   #DELETE /resource/sign_out
   def destroy
      sign_out
      redirect_to new_user_session_path, :flash => {:notice => "Signed out successfully."}
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

   private

   def user_params
      params.require(:user).permit(:password, :email)
   end

end

class Devise::RegistrationsController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
      @user = User.new
      render :new
   end

   def create
   @user = User.new(user_params)
      if @user.save
         sign_in(:user, @user)
         redirect_to user_path(@user.id), :flash => {:notice => "Welcome! You have signed up successfully."}
      else
         redirect_to new_user_registration_path, :flash => {:error => @user.errors.full_messages}
      end
   end

   def update
      existing_user_params = user_params.reject{|_,v| v.blank?}
      @user = current_user
      if @user.update_attributes(existing_user_params)
         redirect_to user_path(@user), :flash => {:notice => "Your account has been updated successfully."}
      else
         render :edit, :flash => {:error => @user.errors.full_messages.first}
      end
   end

   def edit
      @user = current_user
   end



   private

   def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :email_confirmation, :role)
   end

end

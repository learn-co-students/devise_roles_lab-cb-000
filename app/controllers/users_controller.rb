class UsersController < ApplicationController
  load_and_authorize_resource except: :index
  def destroy
    @user.destroy
    redirect_to root_path
  end
end

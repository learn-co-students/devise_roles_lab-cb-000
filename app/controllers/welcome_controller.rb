class WelcomeController < ApplicationController
  def index
    redirect_to users_path unless !current_user 
  end
end
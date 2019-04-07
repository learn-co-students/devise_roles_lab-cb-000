class VisitorsController < ApplicationController
  def about
  end
  def about
  end
  def home
  end
  def signout
    session.clear
    flash[:alert] = "Signed out successfully."
    redirect_to root_path
  end
end

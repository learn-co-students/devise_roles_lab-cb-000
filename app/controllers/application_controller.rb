class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do
    redirect_to root_path, notice: 'Access denied.'
  end
end

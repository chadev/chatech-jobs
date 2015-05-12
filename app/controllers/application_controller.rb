class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    access_denied unless current_user_is_admin?
  end

  def current_user_is_admin?
    user_signed_in? && current_user.admin?
  end

  def access_denied
    redirect_to root_path
  end
end

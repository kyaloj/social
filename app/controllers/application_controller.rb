#
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to login_path unless current_user
  end
end

#
class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  def new() end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Log in successful!'
    else
      redirect_to login_path, notice: 'Invalid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Log out successful!'
  end
end

class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      path = cookies[:path] || tests_path
      cookies.delete(:path)
      redirect_to path
    else
      flash.now.alert = "Oop, incorrect login/password"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to log_in_path
  end
end

class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to plan_path(session[:plan_id]), notice: "Welcome, you're log in"
    else
      #flash[:notice] ="Sorry, you can’t login"
      redirect_to login_url, alert: "Your mail or password is wrong, please check it again"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to lectures_url, notice: "Bye, you're log out"
  end
end

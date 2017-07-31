class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      #redirect_to plan_path(session[:plan_id]), notice: "Welcome, you're log in"
      redirect_to admin_url, notice: t('notice.login')
    else
      #flash[:notice] ="Sorry, you can’t login"
      redirect_to login_url, alert: t('notice.alert')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to lectures_url, notice: t('notice.logout')
  end
end

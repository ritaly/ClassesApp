class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_index_url, notice: "Witaj, jestes zalogowany"
    else
      #flash[:notice] ="Sorry, you can’t login"
      redirect_to login_url, alert: "Hasło lub emeil są nieprawidłowe"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to lectures_url, notice: "Zostałeś wylogowany"
  end
end

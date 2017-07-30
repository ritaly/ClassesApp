class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  before_filter :set_locale


  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Zaloguj się"
    end
  end

  private
  def start_plan
    plan = Plan.find_or_create_by(session[:plan_id])
    session[:plan_id] = plan.id
    plan
  end


  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end
end

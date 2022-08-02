class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?

  def login(user_id)
    session[:user_id] = user_id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def allowed?
    redirect_to root_path, alert: 'Bunu Yapmaya Yetkiniz Yoktur!' unless signed_in?
  end

  def require_user
    redirect_to login_path, alert: 'Öncelikle Giriş Yapmalısınız!' unless signed_in?
  end

  def already_signed_in
    redirect_to current_user, alert: 'Zaten Giriş Yaptınız' if signed_in?
  end
end

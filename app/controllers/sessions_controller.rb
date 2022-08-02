class SessionsController < ApplicationController
  before_action :already_signed_in, only: [:new]
  def new; end

  def create
    user = User.find_by_email params[:email]

    if user&.authenticate(params[:password])
      login(user.id)
      redirect_to root_path, notice: 'Başarıyla Giriş Yaptınız'
    else
      flash[:alert] = 'Email veya Şifre Yanlış!'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Başarıyla Çıkış Yaptınız' }
    end
  end
end

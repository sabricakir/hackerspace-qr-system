class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_user, only: %i[edit update destroy]
  before_action :require_same_user, only: %i[show edit update destroy]
  before_action :already_signed_in, only: [:new]

  def show
    allowed?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      login(@user.id)
      flash[:notice] = "Hoş Geldiniz #{@user.name + ' ' + @user.surname}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = "#{@user.name + ' ' + @user.surname} Hesabınız Başarıyla Güncellendi"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      session[:user_id] = nil
      flash[:notice] = 'Hesabınız Başarıyla Silindi'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :surname, :schoolNumber, :phone,
                                 :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = 'Sadece Kendi Profilinizi Denetleyebilirsiniz!'
      redirect_to current_user
    end
  end
end

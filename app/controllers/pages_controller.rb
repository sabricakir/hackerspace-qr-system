class PagesController < ApplicationController
  before_action:require_user, only: [:home]

  def home
    unless user_signed_in?
      redirect_to new_user_session_path
    end
      @userQrDetails = current_user.id.to_s + " / "  + current_user.email.to_s
      @currentUser = current_user
  end

  def about
  end

  def contact
  end


  private

  def require_user
    unless user_signed_in?
        redirect_to new_user_session_path
    end
  end

  def create
    @user = User.create( user_params )
  end

  def user_params
    params.require(:user).permit(:avatar)
  end

end

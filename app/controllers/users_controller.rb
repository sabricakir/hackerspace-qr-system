class UsersController < ApplicationController

  def show
		@user = User.find(params[:id])
    if @user != current_user
      restrict_user
    end
	end

  def index
  end

  private
  
  def restrict_user
    flash[:danger] = "Bu sayfaya erişim izniniz yoktur!" 
    redirect_to root_path
  end
end

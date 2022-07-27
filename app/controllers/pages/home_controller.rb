class Pages::HomeController < ApplicationController
    before_action:require_user
  
    def index
        @userQrDetails = current_user.id.to_s + " / "  + current_user.email.to_s
        @currentUser = current_user
    end  
 
    private
  
    def require_user
      unless user_signed_in?
          redirect_to new_user_session_path
      end
    end
  
  end
  
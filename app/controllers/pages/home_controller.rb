class Pages::HomeController < ApplicationController
    before_action:require_user

    def index
     key = SecureRandom.random_bytes(32)
     crypt = ActiveSupport::MessageEncryptor.new(key)
     @encrypted_data = crypt.encrypt_and_sign(current_user.email.to_s)
     @currentUser = current_user
     #decrypted_back = crypt.decrypt_and_verify(encrypted_data)
    end

    private

    def require_user
      unless user_signed_in?
          redirect_to new_user_session_path
      end
    end

  end

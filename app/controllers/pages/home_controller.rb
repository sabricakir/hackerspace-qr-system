class Pages::HomeController < ApplicationController
  before_action :home_control

  def index
    key = SecureRandom.random_bytes(32)
    crypt = ActiveSupport::MessageEncryptor.new(key)
    @encrypted_data = crypt.encrypt_and_sign(current_user.email.to_s)
    @currentUser = current_user
    #decrypted_back = crypt.decrypt_and_verify(encrypted_data)
  end

  private
  
  def home_control
    if !signed_in?
      redirect_to login_path
    end
  end

end

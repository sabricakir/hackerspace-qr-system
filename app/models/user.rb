class User < ApplicationRecord
  before_save :set_user_info
  has_secure_password

  has_one_attached :avatar

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, presence: { message: 'İsim alanı zorunludur' },
                   length: { in: 2..20, too_long: 'İsim en fazla %<count>s karakterden oluşabilir', too_short: 'İsim alanı en az 2 karakterden oluşmalıdır' }
  validates :surname, presence: { message: 'Soyisim alanı zorunludur' },
                      length: { in: 2..25, too_long: 'Soyisim en fazla %<count>s karakterden oluşabilir', too_short: 'Soyisim alanı en az 2 karakterden oluşmalıdır' }
  validates :phone, presence: { message: 'Telefon alanı zorunludur' },
                    length: { is: 10, message: 'Telefon 10 haneden oluşmalıdır' }, uniqueness: { message: 'Bu telefon numarası zaten kayıtlı' }, numericality: { message: 'Telefon sadece rakamlardan oluşabilir' }
  validates :schoolNumber, uniqueness: { message: 'Bu okul numarası zaten kayıtlı' },
                           allow_nil: true,
                           length: { maximum: 8, message: 'Okul numarası en fazla 8 haneden oluşmalıdır' }, numericality: { message: 'Okul numarası sadece rakamlardan oluşabilir' }
  validates :email, presence: { message: 'Email alanı zorunludur' },
                    uniqueness: { case_sensitive: false, message: 'Bu email zaten kayıtlı!' },
                    format: { with: VALID_EMAIL_REGEX, message: 'Geçerli bir email adresi giriniz!' }
  validates :password, presence: { message: 'Şifre alanı zorunludur' }, length: { minimum: 8, maximum: 25, too_short: 'Şifre minimum 8 karakterden oluşmalıdır', too_long: 'Şifre maximum 25 karakterden oluşmalıdır' }, if: lambda {
                                                                                                                                                                                                                               password.present?
                                                                                                                                                                                                                             }
  validates :password_confirmation, presence: true, if: -> { password.present? }
  validates :password, confirmation: { allow_blank: true, if: -> { password.present? } }

  private

  def set_user_info
    self.email = email.downcase
    self.name = name.capitalize
    self.surname = surname.upcase
  end
end

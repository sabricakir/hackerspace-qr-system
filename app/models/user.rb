class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_one_attached :avatar

   validates :name, :surname , presence:  true, length: {in: 2..25 , too_long: "%{count} characters is the maximum allowed" }
   validates :phone , presence: true, length: { is: 10 }, uniqueness: true, numericality: true
   validates :schoolNumber , uniqueness: true , allow_nil: true, length:  {maximum: 8}, numericality: true



end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true
    has_secure_password
end
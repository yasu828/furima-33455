class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :fname, presence: true
  validates :lname, presence: true
  validates :fkata, presence: true
  validates :lkata, presence: true
  validates :birth, presence: true
       
end

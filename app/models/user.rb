class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :fname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :lname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :fkata, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :lkata, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
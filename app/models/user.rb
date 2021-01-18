class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname, presence: true
    validates :fname,  format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :lname,  format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :fkata,  format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :lkata,  format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX }
  end
end
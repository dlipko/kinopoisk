class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :encrypted_password, presence: true

  #User may add many films 
  has_many :movies

  #User has many reviews
  #if he delete account, reviews will be deleted
  has_many :reviews, dependent: :destroy

end

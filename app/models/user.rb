class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post, dependent: :destroy

  has_many :like, dependent: :destroy
  has_many :liked_post, through: :like, source: :post
  
end

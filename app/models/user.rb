class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post, dependent: :destroy

  has_many :like, dependent: :destroy
  has_many :liked_post, through: :like, source: :post

  has_many :comment, dependent: :destroy

  has_many :requester, :class_name => 'Friend', :foreign_key => 'requester_id'
  has_many :reciever, :class_name => 'Friend', :foreign_key => 'reciever_id'

  def friend_requests(status = 1)
    self.reciever.where("status = ?", status).collect(&:requester)
  end
  
  def sent_requests(status = 1)
    self.requester.where("status = ?", status).collect(&:reciever)
  end

  def friends
    self.friend_requests(0) + self.sent_requests(0)
  end

end

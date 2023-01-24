class Post < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true
  
  has_many :like, dependent: :destroy
  has_many :likers, through: :like, source: :user
end

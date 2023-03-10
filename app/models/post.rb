class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  
  has_many :like, dependent: :destroy
  has_many :likers, through: :like, source: :user

  has_many :comment, dependent: :destroy
  has_many :commenters, through: :comment, source: :user

  has_one_attached :image

  def self.get_latest
    Post.order("created_at desc")
  end
  
end

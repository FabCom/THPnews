class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6 } 
  validates :content, presence: true

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
end

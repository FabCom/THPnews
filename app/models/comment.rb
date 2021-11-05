class Comment < ApplicationRecord
  validates :content, :user, :commentable, presence: true
  
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
end

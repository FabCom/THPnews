class Comment < ApplicationRecord
  validates :content, :user, :commentable, presence: true
  
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
end

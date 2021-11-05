class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6 } 
  validates :content, presence: true

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
end

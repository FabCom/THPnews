class User < ApplicationRecord
  has_secure_password

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email non valid" }

  validates :password, presence:true, length: { minimum: 6 } 
  validates :first_name, presence:true
  
  belongs_to :city
  has_many :posts
end

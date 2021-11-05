class User < ApplicationRecord
  has_secure_password

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email non valid" }

  validates :password, presence:true, length: { minimum: 6 } 
 # validates_confirmation_of :password, :message => "should match confirmation"
  validates :first_name, presence:true
  
  belongs_to :city
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end

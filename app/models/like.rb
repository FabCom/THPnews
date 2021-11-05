class Like < ApplicationRecord
  validates :user, :likeable, presence: true
  validates_uniqueness_of :likeable_id, scope: :user_id, message: "duplicate like"

  belongs_to :user
  belongs_to :likeable, polymorphic: true
end

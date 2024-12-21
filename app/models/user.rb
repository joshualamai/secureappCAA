class User < ApplicationRecord
  has_secure_password
  has_many :logs, dependent: :destroy 
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true, uniqueness: true # If username validation exists
end




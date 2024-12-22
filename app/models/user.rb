class User < ApplicationRecord
  has_secure_password
  has_many :logs, dependent: :destroy 
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true, uniqueness: true # If username validation exists
  # Save the plaintext password for demonstration purposes only
    before_save :store_plaintext_password
  
    private
  
    def store_plaintext_password
      self.plaintext_password = password
    end
  end





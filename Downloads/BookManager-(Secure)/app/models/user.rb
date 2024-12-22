class User < ApplicationRecord
  has_secure_password # Enables bcrypt for password hashing
  has_many :logs, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: :password_digest_changed?
end




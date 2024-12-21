class Book < ApplicationRecord
  # No encryption or sanitization applied to description (Sensitive Data Exposure)
  validates :title, presence: true
  validates :author, presence: true
  validates :published_date, presence: true
  validates :description, presence: true
end

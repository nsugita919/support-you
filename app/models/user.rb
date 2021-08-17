class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :company_name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 255 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: { case_sensitive: false }
  
  has_secure_password
  
  has_many :support_requests
end

class SupportRequest < ApplicationRecord
  belongs_to :user
  
  validates :contents, presence: true, length: { maximum: 2000 }
  validates :product_name, presence: true
end

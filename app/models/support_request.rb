class SupportRequest < ApplicationRecord
  belongs_to :user
  
  validates :contents, presence: true, length: { maximum: 2000 }
end

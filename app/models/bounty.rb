class Bounty < ApplicationRecord
  validates :title, presence: true, length: { maximum: 128 }
  validates :lat, presence: true, 
    numericality: { less_than_or_equal_to: 90,
                    greater_than_or_equal_to: -90 }
  validates :lng, presence: true, 
    numericality: { less_than_or_equal_to: 180,
                    greater_than_or_equal_to: 0 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { minimum: 64 }
end

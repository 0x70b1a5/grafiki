class Bounty < ApplicationRecord

  has_many :votes, dependent: :destroy
  validates :title, presence: true, length: { maximum: 128 }
  validates :lat, presence: true, 
    numericality: { less_than_or_equal_to: 90,
                    greater_than_or_equal_to: -90 }
  validates :lng, presence: true, 
    numericality: { less_than_or_equal_to: 180,
                    greater_than_or_equal_to: -180 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { minimum: 64 }
  validates :patron, length: { maximum: 64 }
  validates :artist, length: { maximum: 64 }
  validates :address, format: { with: /\A(1|3)[a-zA-Z1-9]{26,33}\z/,
    message: "invalid bitcoin address" }
    # length: { minimum: 26 }
  validates :pic, format: { with: /\A#{URI::ABS_URI}\z/,
    message: "invalid picture url" }
    # length: { minimum: 10 }

end

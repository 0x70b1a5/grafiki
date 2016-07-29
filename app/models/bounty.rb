class Bounty < ApplicationRecord

  has_many :votes, dependent: :destroy
  has_many :escrows
  belongs_to :user

  validates :title, presence: true, length: { maximum: 128 },
    on: [:create]
  validates :lat, presence: true, 
    numericality: { less_than_or_equal_to: 90,
                    greater_than_or_equal_to: -90 },
    on: [:create]
  validates :lng, presence: true, 
    numericality: { less_than_or_equal_to: 180,
                    greater_than_or_equal_to: -180 },
    on: [:create]
  validates :amount, numericality: { greater_than_or_equal_to: 0 },
    on: [:create]
  validates :description, presence: true, length: { maximum: 1024 },
    on: [:create]
  validates :patron, length: { maximum: 64 },
    on: [:create]

  validates :artist, length: { maximum: 64 },
    on: [:fill, :upload, :update]
  validates :address, format: { with: /\A(1|3)[a-zA-Z1-9]{26,33}\z/,
    message: "invalid bitcoin address" },
    length: { minimum: 26, maximum: 33 },
    on: [:fill, :upload, :update]
  validates :pic, format: { with: /\A#{URI::ABS_URI}\z/,
    message: "invalid picture url" },
    length: { minimum: 10 },
    on: [:fill, :upload, :update]

end

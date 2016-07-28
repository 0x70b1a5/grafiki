class Candidate < ApplicationRecord
  belongs_to :escrow

  validates :name, length: { minimum: 3 }
  validates_format_of :email, :with => /@/
  validates :address, format: { 
    with: /\A(1|3)[a-zA-Z1-9]{26,33}\z/,
    message: "invalid bitcoin address" },
    length: {minimum: 26, maximum: 33},
    presence: true
  validates :pic, format: { 
    with: /\A#{URI::ABS_URI}\z/,
    message: "invalid picture url" },
    presence: true
end

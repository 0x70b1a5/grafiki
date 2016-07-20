class Escrow < ApplicationRecord
  belongs_to :bounty
  belongs_to :user

  validates :amount, numericality: greater_than: 0
end

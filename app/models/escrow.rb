class Escrow < ApplicationRecord
  attr_accessor :status
  belongs_to :bounty

  validates :amount, numericality: { greater_than: 0 }
  validates :status, numericality: { greater_than_or_equal_to: 0 }

end

class Escrow < ApplicationRecord
  has_many :candidates
  belongs_to :bounty
end

class Escrow < ApplicationRecord
  belongs_to :bounty

  validates :amount, numericality: { greater_than: 0 }
  validates :status, numericality: { greater_than_or_equal_to: 0 }
  validates :owner_token, length: { is: 28 }
  validates_format_of :owner_email, :with => /@/

  validates :artist_token, length: { is: 28 }, on: :update
  validates_format_of :artist_email, :with => /@/, on: :update
end

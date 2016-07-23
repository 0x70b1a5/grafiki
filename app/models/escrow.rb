class Escrow < ApplicationRecord
  belongs_to :bounty

  validates :amount, numericality: { greater_than: 0 }

  def user_authed
    user_signed_in?
  end
end

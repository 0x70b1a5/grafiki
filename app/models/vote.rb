class Vote < ApplicationRecord
  belongs_to :bounty
  has_one :user, through: :bounty
end

class AddBountyIdToEscrows < ActiveRecord::Migration[5.0]
  def change
    add_column :escrows, :bounty_id, :integer
  end
end

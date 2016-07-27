class AddEscrowIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :escrow_id, :integer
  end
end

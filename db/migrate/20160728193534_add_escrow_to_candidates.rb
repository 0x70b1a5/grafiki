class AddEscrowToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :escrow_id, :integer
  end
end

class RemovePatronIdFromEscrows1 < ActiveRecord::Migration[5.0]
  def change
    remove_column :escrows, :patron_id, :integer
  end
end

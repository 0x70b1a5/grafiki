class AddFieldsToEscrows < ActiveRecord::Migration[5.0]
  def change
    add_column :escrows, :amount, :float
    add_column :escrows, :currency, :string
    add_column :escrows, :patron_id, :integer
    add_column :escrows, :artist_id, :integer
    add_column :escrows, :status, :integer
  end
end

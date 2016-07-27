class AddOwnerTokenToEscrows < ActiveRecord::Migration[5.0]
  def change
    add_column :escrows, :owner_token, :string
  end
end

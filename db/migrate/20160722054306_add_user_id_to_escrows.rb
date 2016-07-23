class AddUserIdToEscrows < ActiveRecord::Migration[5.0]
  def change
    add_column :escrows, :user_id, :integer
  end
end

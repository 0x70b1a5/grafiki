class ChangeStatusDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :escrows, :status, :integer, :default => 0
  end
end

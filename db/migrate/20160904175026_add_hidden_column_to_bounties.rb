class AddHiddenColumnToBounties < ActiveRecord::Migration[5.0]
  def change
    add_column :bounties, :hidden, :boolean, :default => false
  end
end

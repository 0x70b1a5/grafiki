class AddAddressToBounties < ActiveRecord::Migration[5.0]
  def change
    add_column :bounties, :address, :string
  end
end

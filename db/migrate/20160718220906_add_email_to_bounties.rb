class AddEmailToBounties < ActiveRecord::Migration[5.0]
  def change
    add_column :bounties, :email, :string
  end
end

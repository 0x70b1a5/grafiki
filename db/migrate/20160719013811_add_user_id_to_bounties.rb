class AddUserIdToBounties < ActiveRecord::Migration[5.0]
  def change
    add_column :bounties, :userid, :integer
  end
end

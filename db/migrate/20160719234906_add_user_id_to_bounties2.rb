class AddUserIdToBounties2 < ActiveRecord::Migration[5.0]
  def change
    add_column :bounties, :user_id, :integer
  end
end

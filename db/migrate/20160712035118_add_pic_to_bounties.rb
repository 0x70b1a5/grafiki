class AddPicToBounties < ActiveRecord::Migration[5.0]
  def change
    add_column :bounties, :pic, :string
  end
end

class AddScoreToBounties < ActiveRecord::Migration[5.0]
  def change
    add_column :bounties, :score, :integer
  end
end

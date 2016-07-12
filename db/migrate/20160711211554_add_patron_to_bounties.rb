class AddPatronToBounties < ActiveRecord::Migration[5.0]
  def change
    add_column :bounties, :patron, :string
  end
end

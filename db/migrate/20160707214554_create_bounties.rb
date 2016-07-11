class CreateBounties < ActiveRecord::Migration[5.0]
  def change
    create_table :bounties do |t|
      t.float :lat
      t.float :lng
      t.string :title
      t.text :description
      t.float :amount

      t.timestamps
    end
  end
end

class CreateEscrows < ActiveRecord::Migration[5.0]
  def change
    create_table :escrows do |t|

      t.timestamps
    end
  end
end

class DropUsersTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :users
  end
end

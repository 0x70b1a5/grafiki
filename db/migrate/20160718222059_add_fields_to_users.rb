class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :encrypted_password, :string
    add_column :users, :salt, :string
  end
end

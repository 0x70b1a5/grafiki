class AddEmailsToEscrows < ActiveRecord::Migration[5.0]
  def change
    add_column :escrows, :owner_email, :string
    add_column :escrows, :artist_email, :string
  end
end

class AddArtistTokenToEscrows < ActiveRecord::Migration[5.0]
  def change
    add_column :escrows, :artist_token, :string
  end
end

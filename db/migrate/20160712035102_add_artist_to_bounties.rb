class AddArtistToBounties < ActiveRecord::Migration[5.0]
  def change
    add_column :bounties, :artist, :string
  end
end

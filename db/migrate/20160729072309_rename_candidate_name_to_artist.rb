class RenameCandidateNameToArtist < ActiveRecord::Migration[5.0]
  def change
    rename_column :candidates, :name, :artist
  end
end

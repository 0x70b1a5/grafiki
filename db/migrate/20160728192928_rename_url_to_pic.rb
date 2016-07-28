class RenameUrlToPic < ActiveRecord::Migration[5.0]
  def change
    rename_column :candidates, :url, :pic
  end
end

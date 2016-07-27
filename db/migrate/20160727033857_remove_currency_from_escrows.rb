class RemoveCurrencyFromEscrows < ActiveRecord::Migration[5.0]
  def change
    remove_column :escrows, :currency
  end
end

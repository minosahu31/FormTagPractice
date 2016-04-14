class RenameColumnInProduct < ActiveRecord::Migration
  def change
  	rename_column :products, :decritpion, :description
  end
end

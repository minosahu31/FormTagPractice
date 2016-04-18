class UpdateColumnLimit < ActiveRecord::Migration
  def change
 	change_column :employees, :phone_number, :integer, limit: 8
  	change_column :employees, :pin_code, :integer, limit: 8
  end
end

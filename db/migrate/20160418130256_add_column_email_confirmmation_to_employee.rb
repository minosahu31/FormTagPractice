class AddColumnEmailConfirmmationToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :email_confirmation, :string
  end
end

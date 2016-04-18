class AddColumnToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :last_name, :string
    add_column :employees, :email, :string
    add_column :employees, :date_of_birth, :date
    add_column :employees, :gender, :string
    add_column :employees, :phone_number, :integer
    add_column :employees, :address, :string
    add_column :employees, :pin_code, :integer
    add_column :employees, :terms_and_condition, :boolean
  end
end

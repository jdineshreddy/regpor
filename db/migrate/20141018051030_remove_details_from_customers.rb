class RemoveDetailsFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :fname, :string
    remove_column :customers, :lname, :string
    remove_column :customers, :dob, :date
    remove_column :customers, :gender, :string
    remove_column :customers, :mobile, :text
    remove_column :customers, :email, :string
    remove_column :customers, :address, :text
  end
end

class AddDetailsToCustomersProfile < ActiveRecord::Migration
  def change
    add_column :customers_profiles, :fname, :string
    add_column :customers_profiles, :lname, :string
    add_column :customers_profiles, :dob, :date
    add_column :customers_profiles, :gender, :string
    add_column :customers_profiles, :mobile, :string
    add_column :customers_profiles, :email, :string
    add_column :customers_profiles, :address, :text
  end
end

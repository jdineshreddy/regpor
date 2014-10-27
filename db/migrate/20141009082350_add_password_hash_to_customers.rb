class AddPasswordHashToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :password_hash, :string
  end
end

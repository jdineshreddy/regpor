class AddPasswordSaltToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :password_salt, :string
  end
end

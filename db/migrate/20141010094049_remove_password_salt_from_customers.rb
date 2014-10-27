class RemovePasswordSaltFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :password_salt, :string
  end
end

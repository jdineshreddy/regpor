class RemoveColumnsFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :hashed_password, :string
    remove_column :customers, :salt, :string
  end
end

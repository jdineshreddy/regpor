class RemovePasswordConformationFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :password_conformation, :string
  end
end

class AddCustomerIdToCustomersProfiles < ActiveRecord::Migration
  def change
    add_column :customers_profiles, :customer_id, :integer
  end
end

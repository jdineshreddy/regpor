class AddClientIdToCustomersProfiles < ActiveRecord::Migration
  def change
    add_column :customers_profiles, :client_id, :integer
  end
end

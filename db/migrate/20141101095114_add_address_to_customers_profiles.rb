class AddAddressToCustomersProfiles < ActiveRecord::Migration
  def change
    add_column :customers_profiles, :country, :string
    add_column :customers_profiles, :state, :string
  end
end

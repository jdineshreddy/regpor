class RemoveEmailFromCustomersProfiles < ActiveRecord::Migration
  def change
    remove_column :customers_profiles, :email, :string
  end
end

class CreateCustomersProfiles < ActiveRecord::Migration
  def change
    create_table :customers_profiles do |t|

      t.timestamps
    end
  end
end

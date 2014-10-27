class AddPasswordResetToCustomersProfiles < ActiveRecord::Migration
  def change
    add_column :customers_profiles, :password_reset_token, :string
    add_column :customers_profiles, :password_reset_sent_at, :datetime
  end
end

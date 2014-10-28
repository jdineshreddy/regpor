class RemovePasswordResetFromCustomersProfiles < ActiveRecord::Migration
  def change
    remove_column :customers_profiles, :password_reset_token, :string
    remove_column :customers_profiles, :password_reset_sent_at, :datetime
  end
end

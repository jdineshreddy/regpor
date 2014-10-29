class RemovePasswordResetSentAtFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :password_reset_sent_at, :datetime
  end
end

class AddClientIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :client_id, :integer
  end
end

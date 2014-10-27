class AddCustomersPostsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :customers_posts, :text

  end
end

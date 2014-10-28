class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end

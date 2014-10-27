class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :fname
      t.string :lname
      t.string :username
      t.string :password
      t.date :dob
      t.string :gender
      t.integer :mobile

      t.timestamps
    end
  end
end

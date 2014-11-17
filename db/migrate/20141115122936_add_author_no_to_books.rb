class AddAuthorNoToBooks < ActiveRecord::Migration
  def change
    add_column :books, :author_no, :integer
  end
end

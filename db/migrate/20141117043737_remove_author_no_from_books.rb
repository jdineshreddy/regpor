class RemoveAuthorNoFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :author_no, :integer
  end
end

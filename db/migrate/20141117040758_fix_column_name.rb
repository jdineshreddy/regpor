class FixColumnName < ActiveRecord::Migration
  def change
     rename_column :authors, :name, :author_name
  end
end

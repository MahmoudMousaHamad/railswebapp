class RenameToAndFrom < ActiveRecord::Migration[5.2]
  def change
    rename_column :conferences, :from, :from_date
    rename_column :conferences, :to, :to_date
  end
end

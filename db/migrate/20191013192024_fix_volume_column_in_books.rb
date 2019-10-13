class FixVolumeColumnInBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :volumne
    add_column :books, :volume, :string 
  end
end

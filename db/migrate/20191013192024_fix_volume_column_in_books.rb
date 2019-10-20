class FixVolumeColumnInBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :volume, :string 
  end
end

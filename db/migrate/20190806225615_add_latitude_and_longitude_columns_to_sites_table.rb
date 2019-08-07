class AddLatitudeAndLongitudeColumnsToSitesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :latitude, :float
    add_column :sites, :longitude, :float
  end
end

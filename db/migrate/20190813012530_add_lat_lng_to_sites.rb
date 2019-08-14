class AddLatLngToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :lat, :float
    add_column :sites, :lng, :float

    remove_column :sites, :latitude
    remove_column :sites, :longitude

  end
end

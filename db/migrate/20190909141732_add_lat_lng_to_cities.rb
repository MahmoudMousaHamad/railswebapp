class AddLatLngToCities < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :lat, :float
    add_column :cities, :lng, :float
  end
end

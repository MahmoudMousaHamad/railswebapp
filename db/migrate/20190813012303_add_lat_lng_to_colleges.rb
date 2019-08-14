class AddLatLngToColleges < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :lat, :float
    add_column :colleges, :lng, :float
  end
end

class AddLatLngToUniversities < ActiveRecord::Migration[5.2]
  def change
    add_column :universities, :lat, :float
    add_column :universities, :lng, :float
  end
end

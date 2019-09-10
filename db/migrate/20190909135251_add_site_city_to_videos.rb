class AddSiteCityToVideos < ActiveRecord::Migration[6.0]
  def change
    # add_reference :videos, :city, null: false, foreign_key: true
    add_reference :videos, :city, foreign_key: true
  end
end

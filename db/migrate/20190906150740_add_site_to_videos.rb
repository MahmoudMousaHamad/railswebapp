class AddSiteToVideos < ActiveRecord::Migration[6.0]
  def change
    add_reference :videos, :site, foreign_key: true
  end
end

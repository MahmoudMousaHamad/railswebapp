class SitesBelongsToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :sites, :user, index: true, foreign_key: true
  end
end
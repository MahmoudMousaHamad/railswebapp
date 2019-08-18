class ChangeDatetimesInConferences < ActiveRecord::Migration[5.2]
  def change
    remove_column :conferences, :date_time
    add_column :conferences, :from, :datetime    
    add_column :conferences, :to, :datetime
  end
end

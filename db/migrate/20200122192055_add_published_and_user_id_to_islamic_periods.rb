class AddPublishedAndUserIdToIslamicPeriods < ActiveRecord::Migration[6.0]
  def change
    add_column :islamic_periods, :published, :boolean
    add_column :islamic_periods, :user_id, :integer
  end
end

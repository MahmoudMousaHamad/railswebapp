class AddPublishedAndUserIdToIslamicPeriods < ActiveRecord::Migration[6.0]
  def change
    add_column :islamic_periods, :published, :boolean unless column_exists? :islamic_periods, :published
    add_column :islamic_periods, :user_id, :integer unless column_exists? :islamic_periods, :user_id
  end
end

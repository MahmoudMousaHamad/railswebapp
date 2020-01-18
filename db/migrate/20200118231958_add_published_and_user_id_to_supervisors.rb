class AddPublishedAndUserIdToSupervisors < ActiveRecord::Migration[6.0]
  def change
    add_column :supervisors, :published, :boolean
    add_column :supervisors, :user_id, :integer
  end
end

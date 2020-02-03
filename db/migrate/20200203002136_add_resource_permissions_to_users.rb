class AddResourcePermissionsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :resource_permissions, :string
  end
end

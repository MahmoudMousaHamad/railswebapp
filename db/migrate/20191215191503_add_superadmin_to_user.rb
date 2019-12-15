class AddSuperadminToUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :role
    remove_column :users, :country
    remove_column :users, :is_verified

    add_column :users, :role, :string, :null => "member", :default => "member"
    add_column :users, :country, :string
    add_column :users, :verified, :boolean, :null => false, :default => false
    
  end
end

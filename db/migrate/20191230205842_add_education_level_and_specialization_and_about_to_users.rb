class AddEducationLevelAndSpecializationAndAboutToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :education_level, :string
    add_column :users, :specialization, :string
    add_column :users, :about, :text
  end
end

class ChangeNumberInIssues < ActiveRecord::Migration[6.0]
  def change
    change_column :issues, :number, :string
  end
end

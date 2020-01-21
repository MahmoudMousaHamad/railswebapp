class AddCollectionNumberToIssues < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :collection_number, :string
  end
end

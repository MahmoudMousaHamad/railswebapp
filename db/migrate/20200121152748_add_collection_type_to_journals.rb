class AddCollectionTypeToJournals < ActiveRecord::Migration[6.0]
  def change
    add_column :journals, :collection_type, :string
  end
end

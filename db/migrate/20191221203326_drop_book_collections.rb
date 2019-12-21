class DropBookCollections < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :book_collection_id
    drop_table :book_collections, dependent: :cascade
  end
end

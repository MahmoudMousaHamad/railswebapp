class CreateBookCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :book_collections do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateJournals < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.string :title
      t.string :about
      t.integer :coverageFrom
      t.integer :coverageTo
      t.string :es
      t.references :publisher, foreign_key: true
      t.string :issn

      t.timestamps
    end
  end
end

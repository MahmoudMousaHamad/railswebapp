class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.integer :number
      t.integer :year
      t.integer :pageFrom
      t.integer :pageTo
      t.references :journal, foreign_key: true

      t.timestamps
    end
  end
end

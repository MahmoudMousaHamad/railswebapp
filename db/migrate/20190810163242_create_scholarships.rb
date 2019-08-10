class CreateScholarships < ActiveRecord::Migration[5.2]
  def change
    create_table :scholarships do |t|
      t.string :name
      t.text :about
      t.string :degree
      t.text :scholarship
      t.datetime :deadline
      t.references :university, foreign_key: true

      t.timestamps
    end
  end
end

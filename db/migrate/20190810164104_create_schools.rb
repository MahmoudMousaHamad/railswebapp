class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.text :about
      t.text :professors
      t.references :college, foreign_key: true
      t.references :university, foreign_key: true

      t.timestamps
    end
  end
end

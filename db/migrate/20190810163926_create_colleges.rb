class CreateColleges < ActiveRecord::Migration[5.2]
  def change
    create_table :colleges do |t|
      t.string :name
      t.text :about
      t.references :university, foreign_key: true

      t.timestamps
    end
  end
end

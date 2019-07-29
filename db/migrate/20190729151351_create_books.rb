class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :about
      t.integer :year
      t.string :author
      t.integer :pages

      t.timestamps
    end
  end
end

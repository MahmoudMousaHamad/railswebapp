class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :about
      t.references :issue, null: false, foreign_key: true
      t.integer :user_id
      t.boolean :published
      t.integer :page_from
      t.integer :page_to

      t.timestamps
    end
  end
end

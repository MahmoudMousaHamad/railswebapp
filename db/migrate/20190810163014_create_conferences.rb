class CreateConferences < ActiveRecord::Migration[5.2]
  def change
    create_table :conferences do |t|
      t.string :name
      t.text :about
      t.references :city, foreign_key: true
      t.references :country, foreign_key: true
      t.string :website
      t.string :organizer
      t.text :papers
      t.float :lat
      t.float :lng
      t.datetime :date_time

      t.timestamps
    end
  end
end

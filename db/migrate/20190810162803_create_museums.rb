class CreateMuseums < ActiveRecord::Migration[5.2]
  def change
    create_table :museums do |t|
      t.string :name
      t.text :about
      t.references :city, foreign_key: true
      t.references :country, foreign_key: true
      t.string :website
      t.text :ticket_price
      t.text :working_hours
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end

class CreateCountryReferences < ActiveRecord::Migration[6.0]
  def change
    create_table :country_references do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.date :publication_date

      t.timestamps
    end
  end
end

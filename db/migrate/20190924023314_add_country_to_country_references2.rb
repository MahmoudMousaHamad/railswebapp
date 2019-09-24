class AddCountryToCountryReferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :country_references, :country
    remove_column :country_references, :reference
    add_reference :country_references, :country, foreign_key: true
  end
end

class AddCountryToCountryReferences3 < ActiveRecord::Migration[6.0]
  def change
    add_reference :country_references, :country, foreign_key: true
  end
end

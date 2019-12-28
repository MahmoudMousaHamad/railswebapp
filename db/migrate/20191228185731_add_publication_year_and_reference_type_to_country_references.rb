class AddPublicationYearAndReferenceTypeToCountryReferences < ActiveRecord::Migration[6.0]
  def change
    add_column :country_references, :publication_year, :integer
    add_column :country_references, :reference_type, :string
  end
end

class RemovePublicationDateAndPeriodFromCountryReferences < ActiveRecord::Migration[6.0]
  def change

    remove_column :country_references, :publication_date, :string

    remove_column :country_references, :period, :string
  end
end

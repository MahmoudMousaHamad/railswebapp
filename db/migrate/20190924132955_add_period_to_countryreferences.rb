class AddPeriodToCountryreferences < ActiveRecord::Migration[6.0]
  def change
    add_column :country_references, :period, :string
  end
end

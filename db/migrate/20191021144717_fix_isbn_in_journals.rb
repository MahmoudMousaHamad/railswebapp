class FixIsbnInJournals < ActiveRecord::Migration[6.0]
  def change
    remove_column :journals, :issn
    add_column :journals, :isbn, :string
  end
end

class RemoveEsColumnFromJournals < ActiveRecord::Migration[5.2]
  def change
    remove_column :journals, :es
  end
end

class AddArabicTitleToJournals < ActiveRecord::Migration[6.0]
  def change
    add_column :journals, :arabic_title, :string
  end
end

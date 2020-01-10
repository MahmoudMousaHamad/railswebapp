class AddSecondLanguageToJournals < ActiveRecord::Migration[6.0]
  def change
    add_column :journals, :second_language, :string
  end
end

class AddLanguageToAllDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :journals, :language, :string
    add_column :academic_papers, :language, :string
  end
end

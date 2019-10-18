class AddKeywordsFieldToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :keywords, :string
    add_column :academic_papers, :keywords, :string
    add_column :journals, :keywords, :string
  end
end

class AddPublishedFieldsToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :published, :boolean
    add_column :academic_papers, :published, :boolean
    add_column :journals, :published, :boolean
    add_column :countries, :published, :boolean
  end
end

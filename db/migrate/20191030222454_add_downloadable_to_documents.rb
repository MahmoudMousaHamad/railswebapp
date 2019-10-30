class AddDownloadableToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :downloadable, :boolean
    add_column :academic_papers, :downloadable, :boolean
    add_column :journals, :downloadable, :boolean
    add_column :countries, :downloadable, :boolean
  end
end

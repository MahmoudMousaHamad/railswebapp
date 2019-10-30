class AddDownloadableToIssuesAndRemoveDownloadableFromJournals2 < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :downloadable, :boolean
    remove_column :journals, :downloadable
  end
end

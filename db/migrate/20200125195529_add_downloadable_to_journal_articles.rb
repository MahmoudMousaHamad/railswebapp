class AddDownloadableToJournalArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :journal_articles, :downloadable, :boolean
  end
end

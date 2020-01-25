class RenameArticlesToJournalArticles < ActiveRecord::Migration[6.0]
  def change
    rename_table :articles, :journal_articles
  end
end

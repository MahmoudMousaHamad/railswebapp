class CreateJournalArticlesAuthorsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :journal_articles, :authors do |t|
      t.index :author_id, name: "index_journal_articles_authors_on_article_id_and_author_id"
      t.index :journal_article_id, name: "index_journal_articles_authors_on_author_id_and_article_id"
    end
  end
end

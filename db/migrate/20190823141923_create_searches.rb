class CreateSearches < ActiveRecord::Migration[5.2]
  def self.up
    ActiveRecord::Base.connection.execute <<-SQL
    CREATE VIEW searches AS
      SELECT  journals.id AS searchable_id, journals.title AS term, 
              CAST ('Journal' AS varchar) AS searchable_type 
      FROM journals
      UNION 
      SELECT  books.id AS searchable_id, books.title AS term, 
              CAST ('Book' AS varchar) AS searchable_type 
      FROM books
    SQL
  end

  def self.down
    ActiveRecord::Base.connection.execute <<-SQL
      DROP VIEW searches
    SQL
  end
end

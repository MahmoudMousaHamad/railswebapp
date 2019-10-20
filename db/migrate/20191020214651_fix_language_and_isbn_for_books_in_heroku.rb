class FixLanguageAndIsbnForBooksInHeroku < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :language, :string
    add_column :books, :isbn, :string
  end
end

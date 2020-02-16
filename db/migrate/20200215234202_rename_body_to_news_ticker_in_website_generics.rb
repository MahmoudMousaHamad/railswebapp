class RenameBodyToNewsTickerInWebsiteGenerics < ActiveRecord::Migration[6.0]
  def change
    rename_column :website_generics, :body, :news_ticker
  end
end

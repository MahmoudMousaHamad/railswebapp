class ChangeNewsTicker < ActiveRecord::Migration[6.0]
  def change
    rename_table :news_tickers, :website_generics
    add_column :website_generics, :about_us_content, :text
    add_column :website_generics, :facebook_url, :string
    add_column :website_generics, :twitter_url, :string
    add_column :website_generics, :instagram_url, :string
  end
end

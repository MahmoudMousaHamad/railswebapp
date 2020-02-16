class CreateWebsiteGeneric < ActiveRecord::Migration[6.0]
  def change
    create_table :news_tickers do |t|
      t.text :body
      t.timestamps
    end
  end
end

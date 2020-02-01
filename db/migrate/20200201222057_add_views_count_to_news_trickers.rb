class AddViewsCountToNewsTrickers < ActiveRecord::Migration[6.0]
  def change
    add_column :news_tickers, :views_count, :integer
  end
end

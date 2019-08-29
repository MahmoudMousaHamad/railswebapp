class AddDateOccuredToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :date_occurred, :date
  end
end

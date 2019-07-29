class AddPublisherToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :publisher, foreign_key: true
  end
end

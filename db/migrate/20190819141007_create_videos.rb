class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :link
      t.references :countery, foreign_key: true

      t.timestamps
    end
  end
end

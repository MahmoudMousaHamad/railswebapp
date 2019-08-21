class ChangeTopicsToDisciplines < ActiveRecord::Migration[5.2]
  def change
    rename_table :topics, :disciplines
  end
end

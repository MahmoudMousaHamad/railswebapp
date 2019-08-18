class AddCategoryToConferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :conferences, :category, foreign_key: true
    add_reference :scholarships, :category, foreign_key: true
  end
end

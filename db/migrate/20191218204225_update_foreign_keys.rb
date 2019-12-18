class UpdateForeignKeys < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :cities, :countries
    remove_foreign_key :sites, :countries
    remove_foreign_key :museums, :countries
    remove_foreign_key :conferences, :countries
    remove_foreign_key :scholarships, :countries
    remove_foreign_key :posts, :countries
    remove_foreign_key :universities, :countries
    remove_foreign_key :country_references, :countries

    add_foreign_key :cities, :countries, on_delete: :cascade
    add_foreign_key :sites, :countries, on_delete: :cascade
    add_foreign_key :museums, :countries, on_delete: :cascade
    add_foreign_key :conferences, :countries, on_delete: :cascade
    add_foreign_key :scholarships, :countries, on_delete: :cascade
    add_foreign_key :posts, :countries, on_delete: :cascade
    add_foreign_key :universities, :countries, on_delete: :cascade
    add_foreign_key :country_references, :countries, on_delete: :cascade
  end
end

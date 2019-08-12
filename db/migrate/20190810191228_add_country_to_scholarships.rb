class AddCountryToScholarships < ActiveRecord::Migration[5.2]
  def change
    add_reference :scholarships, :country, foreign_key: true
  end
end

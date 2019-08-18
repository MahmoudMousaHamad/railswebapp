class Scholarship < ApplicationRecord
  include Filterable
  
  belongs_to :university
  belongs_to :country
  belongs_to :category

  paginates_per 5

  scope :country_id, -> (country_id) { where country_id: country_id }
  scope :degree, -> (degree) { where("degree LIKE ?", degree) }
  scope :category, -> (category_id) { where category_id: category_id }
  scope :university, -> (university_id) { where university_id: university_id }
  scope :q, -> (q) { where("name like ?", "%#{q}%") }
end

class Scholarship < ApplicationRecord
  include Filterable
  
  belongs_to :university
  belongs_to :country
  belongs_to :category

  paginates_per 5

end

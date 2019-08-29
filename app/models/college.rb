class College < ApplicationRecord
  include Filterable
    
  belongs_to :university
  has_many :schools

  paginates_per 5

end

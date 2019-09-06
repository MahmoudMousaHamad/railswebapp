class College < ApplicationRecord
  include Filterable
    
  belongs_to :university
  has_many :schools

  has_one_attached :logo

  paginates_per 5

end

class School < ApplicationRecord
  include Filterable
    
  belongs_to :college
  belongs_to :university

  has_one_attached :logo

  paginates_per 5

end

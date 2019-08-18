class College < ApplicationRecord
  belongs_to :university
  has_many :schools

  paginates_per 5

end

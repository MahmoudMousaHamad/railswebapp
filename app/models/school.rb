class School < ApplicationRecord
  belongs_to :college
  belongs_to :university

  paginates_per 5

end

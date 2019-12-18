class School < ApplicationRecord
  include Filterable
  include Publishable

  user_owned
    
  belongs_to :college
  belongs_to :university

  has_one_attached :logo

  paginates_per 5

end

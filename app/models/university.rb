class University < ApplicationRecord
  include Filterable

  user_owned
    
  belongs_to :city
  belongs_to :country
  has_many :scholarships
  has_many :colleges

  has_one_attached :logo
  has_many_attached :photos

  has_many :colleges
  has_many :schools

  paginates_per 5

end

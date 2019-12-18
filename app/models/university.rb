class University < ApplicationRecord
  include Filterable
  include Publishable

  user_owned
    
  belongs_to :city
  belongs_to :country
  has_many :scholarships, dependent: :destroy
  has_many :colleges, dependent: :destroy
  has_many :schools, dependent: :destroy
  
  has_one_attached :logo
  has_many_attached :photos

  

  paginates_per 5

end

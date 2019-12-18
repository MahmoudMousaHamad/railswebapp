class College < ApplicationRecord
  include Filterable
  include Publishable

  user_owned
    
  belongs_to :university
  has_many :schools, dependent: :destroy

  has_one_attached :logo

  paginates_per 5

end

class Museum < ApplicationRecord
  include Filterable
  include Publishable

  user_owned
    
  belongs_to :city
  belongs_to :country

  has_many_attached :photos
  has_one_attached :logo

  validates_presence_of :name

  paginates_per 5
end

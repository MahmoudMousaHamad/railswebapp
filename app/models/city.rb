class City < ApplicationRecord
  include Filterable
    
  belongs_to :country
  has_many :sites

  has_many_attached :photos

  validates :name, uniqueness: true
end

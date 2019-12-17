class City < ApplicationRecord
  include Filterable

  user_owned
    
  belongs_to :country
  has_many :sites

  has_many_attached :slideshow_photos
  has_many_attached :gallery_photos

  validates :name, uniqueness: true
end

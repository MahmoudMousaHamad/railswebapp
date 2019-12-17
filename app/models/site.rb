class Site < ApplicationRecord
  include Filterable

  user_owned
    
  belongs_to :city
  belongs_to :country

  has_many :video

  has_many_attached :slideshow_photos
  has_many_attached :gallery_photos

  validates :name, presence: true, uniqueness: true
  validates :about, presence: true
end

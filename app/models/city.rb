class City < ApplicationRecord
  include Filterable
  include Publishable

  user_owned
    
  belongs_to :country
  has_many :sites, dependent: :destroy
  has_many :museums, dependent: :destroy
  has_many :universities, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many_attached :slideshow_photos, dependent: :destroy
  has_many_attached :gallery_photos, dependent: :destroy

  validates :name, uniqueness: true
end

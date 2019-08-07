class Site < ApplicationRecord
  belongs_to :city
  belongs_to :country

  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :about, presence: true

  geocoded_by :address
  after_validation :geocode

  def address
    [name, city, country].compact.join(', ')
  end

end

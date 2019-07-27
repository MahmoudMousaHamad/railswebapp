class City < ApplicationRecord
  belongs_to :country
  has_many :sites

  has_many_attached :photos

  validates :name, uniqueness: true
end

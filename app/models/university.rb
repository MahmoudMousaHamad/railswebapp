class University < ApplicationRecord
  belongs_to :city
  belongs_to :country
  has_many :scholarships
  has_many :colleges

  has_one_attached :logo
  has_many_attached :photos

  has_many :colleges
  has_many :schools
end

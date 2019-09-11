class Site < ApplicationRecord
  include Filterable
    
  belongs_to :city
  belongs_to :country

  has_many :video

  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :about, presence: true
end

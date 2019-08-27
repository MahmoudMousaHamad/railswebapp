class Museum < ApplicationRecord
  belongs_to :city
  belongs_to :country

  has_many_attached :photos
  has_one_attached :logo

  validates_presence_of :name, :about, :city_id, :country_id, :photos, :logl, :website, :ticket_price, :working_hours, :type

  paginates_per 5
end

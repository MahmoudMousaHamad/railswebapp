class Museum < ApplicationRecord
  include Filterable

  user_owned
    
  belongs_to :city
  belongs_to :country

  has_many_attached :photos
  has_one_attached :logo

  validates_presence_of :name, :about, :city_id, :country_id, :photos, :logo, :website, :kind, :logo, :working_hours, :ticket_price

  paginates_per 5
end

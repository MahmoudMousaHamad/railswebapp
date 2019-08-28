class Museum < ApplicationRecord
  belongs_to :city
  belongs_to :country

  has_many_attached :photos
  has_one_attached :logo

  validates_presence_of :name, :about, :city_id, :country_id, :photos, :logo, :website, :kind, :logo, :working_hours, :ticket_price

  scope :q, -> (q) { where("name like ?", "%#{q}%") if q }
  scope :kind, -> (kind) { where("kind like ?", "%#{kind}%") }

  paginates_per 5
end

class Conference < ApplicationRecord
  include Filterable

  belongs_to :city
  belongs_to :country 
  belongs_to :category
  
  paginates_per 5

  scope :country_id, -> (country_id) { where("country_id = ?", country_id) }
  scope :category, -> (category_id) { where category_id: category_id }
  scope :period, -> (period) { get_period period }
  scope :q, -> (q) { where("name like ?", "%#{q}%") }

  def self.get_period(period)
    if period == "past"
      where("to_date < ?", Time.now)
    elsif period == "current"
      where(["from_date <= ? and to_date > ?", Time.now, Time.now])
    elsif period == "upcoming"
      where("from_date > ?", Time.now)
    else
      where(nil)
    end
  end
end

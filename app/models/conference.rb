class Conference < ApplicationRecord
  include Filterable

  belongs_to :city
  belongs_to :country 
  belongs_to :category
  
  paginates_per 5

  scope :country, -> (country_id) { where("country_id = ?", country_id) }
  scope :period, -> (period) {
    if period
      if period == "past"
        where("to_date < ?", Time.now)
      elsif period == "current"
        where(["from_date <= ? and to_date > ?", Time.now, Time.now])
      elsif period == "upcoming"
        where("from_date > ?", Time.now)
      else
        where(nil)
      end
    else
      where(["from_date <= ? and to_date > ?", Time.now, Time.now])
    end
  }
  scope :category, -> (category_id) { 
    if !category_id || category_id == ""
      where(nil)
    else
      where("category_id = ?", category_id)
    end
    
  }
end

class Conference < ApplicationRecord
  include Filterable

  belongs_to :city
  belongs_to :country 
  belongs_to :category

  has_many_attached :photos
  
  paginates_per 5

  scope :period, -> (period) { get_period period }

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

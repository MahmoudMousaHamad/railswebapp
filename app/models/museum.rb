class Museum < ApplicationRecord
  belongs_to :city
  belongs_to :country

  has_many_attached :photos

  paginates_per 5
end

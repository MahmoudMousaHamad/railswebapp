class Conference < ApplicationRecord
  belongs_to :city
  belongs_to :country
end

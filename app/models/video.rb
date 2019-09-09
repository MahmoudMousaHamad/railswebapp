class Video < ApplicationRecord
  include Filterable
  
  belongs_to :country
  belongs_to :city
  belongs_to :site
end

class Video < ApplicationRecord
  include Filterable
    
  belongs_to :country
end
